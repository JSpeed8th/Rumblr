class BlogsController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @blogs = Blog.all
    @blog = Blog.new
    @comments = Comment.all
    @comment = Comment.new
    # @blogSingle = Blog.find(params[:id])
  end

  # def new
  #   @blog = Blog.new
  # end

  def create
    @user = current_user
    b = Blog.create(blog_params)
    b.user_id = @user.id
    b.save
      redirect_to "/"
  end

  private
    def blog_params
      params.require(:blog).permit(:body, :title, :user)
    end

    def comments_params
      params.require(:comment).permit(:body, :user_id, :blog_id)
    end
end
