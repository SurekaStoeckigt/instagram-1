class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def post_params
    params.require(:post).permit(:title, :image)
  end

  def new
    @post = Post.new
  end

  def create
    Post.create(post_params)
    redirect_to '/posts'
  end

end
