class CommentsController < ApplicationController

  def index
    @comment = Comment.all
  end

  def new
    @comment = Comment.new
  end

  def create
    @blog = Blog.find(params[:blog_id])
    @comment = current_user.comments.new(comments_params)
    @comment.blog = @blog
    if @comment.save
      redirect_to "/"
    end
  end

  private

  def comments_params
    params.require(:comment).permit(:body, :user_id, :blog_id)
  end
end
