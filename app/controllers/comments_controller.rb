class CommentsController < ApplicationController

  def comment_params
    params.require(:comment).permit(:thoughts)
  end

  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @post.comments.create(comment_params)
    redirect_to '/'
  end

end
