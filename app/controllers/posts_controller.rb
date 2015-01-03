class PostsController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]
  before_action :require_permission, :only => [:edit, :delete]

  def require_permission
    if current_user != Post.find(params[:id]).user
    redirect_to '/'
  end
  end

  def post_params
    params.require(:post).permit(:title, :image)
  end

  def find_id
    @post = Post.find(params[:id])
  end

  def index
    @posts = Post.all
    if user_signed_in?
      @user_id = current_user.id
    else
      @user_id = nil
    end
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to '/'
    else
      flash[:notice] = "You cannot add a photo if you are not logged in"
    end
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
    redirect_to '/'
  end

  def destroy
    find_id
    @post.destroy
    redirect_to '/'
    flash[:notice] = "Post deleted!"
  end

end
