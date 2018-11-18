class UsersController < ApplicationController
  before_action :authenticate_user!

  def edit
    # @user = User.find(params[:id])
    @user = User.find(current_user.id)
  end

  private

  # params.require(:user).permit(:email, )

end
