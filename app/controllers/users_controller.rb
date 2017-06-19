class UsersController < ApplicationController
  before_action :authorize_user, except: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(users_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private

  def users_params
    params.require(:user).permit(:username, :password)
  end
end
