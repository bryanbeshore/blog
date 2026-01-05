class PagesController < ApplicationController
  def home
    @recent_posts = Post.recent.first(3)
  end

  def about
  end
end
