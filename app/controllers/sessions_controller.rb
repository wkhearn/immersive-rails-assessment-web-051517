class SessionsController < ApplicationController
  before_action :authorize_user, except: [:new, :create, :welcome]

  def welcome
    @user = current_user
  end

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(username: params[:user][:username])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to root_path
    else
      redirect_to sessions_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
