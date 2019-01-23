class UsersController < ApplicationController
  before_action :authenticate_user!

  def edit
    @user = User.find(current_user.id)
  end

  def update
    user = User.find(current_user.id)
    if user.update(user_params)
      redirect_to "/users/#{user.id}"
    end
  end

  def destroy
    user = User.find(params[:id])
    if user.destroy
      redirect_to '/'
    end
  end

  def show
    @user = User.find(params[:id])
    @blogs = @user.blogs
    @comments = Comment.all
    @length_of_users = User.all.length
    @user_array = []
  end

  private

  def user_params
    params.require(:user).permit(:email, :fname, :lname, :birthdate, :about_me)
  end

end
