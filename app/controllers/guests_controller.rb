class GuestsController < ApplicationController
  before_action :authorize_user

  def index
    @guests = Guest.all
  end

  def show
    @guest = Guest.find(params[:id])
  end
end
