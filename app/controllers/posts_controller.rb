class PostsController < ApplicationController
  def index
    @posts = Post.recent
  end

  def show
    @post = Post.find_by_slug!(params[:slug])
  end

  def feed
    @posts = Post.recent.first(20)
    respond_to do |format|
      format.xml
    end
  end
end
