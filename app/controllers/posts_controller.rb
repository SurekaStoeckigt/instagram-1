class PostsController < ApplicationController

  def post_params
    params.require(:post).permit(:title, :image)
  end

  def find_id
    @post = Post.find(params[:id])
  end

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    Post.create(post_params)
    redirect_to '/posts'
  end

  def show
    find_id
  end

  def edit
    find_id
  end

  def update
    find_id
    @post.update(post_params)
    redirect_to '/posts'
  end

end
