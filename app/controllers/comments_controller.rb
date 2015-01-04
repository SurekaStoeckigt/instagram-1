class CommentsController < ApplicationController

  def comment_params
    params.require(:comment).permit(:thoughts, :user_id, :name)
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

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:notice]= 'Comment deleted successfully'
    redirect_to '/'
  end

end
