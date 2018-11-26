class BlogsController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @blogs = Blog.all
    @blog = Blog.new
    @comments = Comment.all
    @comment = Comment.new
    @allUsers = User.all
    # @blogSingle = Blog.find(params[:id])
  end

  def create
    @user = current_user
    b = Blog.create(blog_params)
    b.user_id = @user.id
    b.save
      redirect_to "/"
  end

  def edit
    @blog = Blog.find(params[:id])
    @user = current_user
  end

  def update
    blog = Blog.find(params[:id])
    if blog.update(blog_params)
      redirect_to '/'
    else
      render '/blogs/#{blog.id}/edit'
    end
  end

  def destroy
    blog = Blog.find(params[:id])
    if blog.destroy
      redirect_to '/'
    end
  end

  private
    def blog_params
      params.require(:blog).permit(:body, :title, :user)
    end

    def comments_params
      params.require(:comment).permit(:body, :user_id, :blog_id)
    end
end
