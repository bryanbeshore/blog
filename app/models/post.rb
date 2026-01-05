class Post
  CONTENT_PATH = Rails.root.join("content", "posts")

  attr_reader :slug, :title, :date, :description, :body

  def initialize(slug:, title:, date:, description: nil, body:)
    @slug = slug
    @title = title
    @date = date.is_a?(Date) ? date : Date.parse(date)
    @description = description
    @body = body
  end

  def to_param
    slug
  end

  def html_body
    renderer = Redcarpet::Render::HTML.new(
      hard_wrap: true,
      link_attributes: { target: "_blank", rel: "noopener" }
    )
    markdown = Redcarpet::Markdown.new(renderer,
      autolink: true,
      fenced_code_blocks: true,
      footnotes: true,
      highlight: true,
      smartypants: true
    )
    markdown.render(body).html_safe
  end

  class << self
    def all
      @posts ||= load_posts
    end

    def recent
      all.sort_by(&:date).reverse
    end

    def find_by_slug!(slug)
      all.find { |p| p.slug == slug } || raise(ActiveRecord::RecordNotFound)
    end

    def reload!
      @posts = nil
      all
    end

    private

    def load_posts
      Dir.glob(CONTENT_PATH.join("*.md")).map do |file|
        parse_post(file)
      end
    end

    def parse_post(file)
      content = File.read(file)
      slug = File.basename(file, ".md")

      if content.start_with?("---")
        parts = content.split("---", 3)
        frontmatter = YAML.safe_load(parts[1], permitted_classes: [Date])
        body = parts[2].strip
      else
        frontmatter = {}
        body = content
      end

      new(
        slug: slug,
        title: frontmatter["title"] || slug.titleize,
        date: frontmatter["date"] || File.mtime(file).to_date,
        description: frontmatter["description"],
        body: body
      )
    end
  end
end
