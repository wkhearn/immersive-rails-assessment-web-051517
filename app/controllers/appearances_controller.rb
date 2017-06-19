class AppearancesController < ApplicationController
  before_action :authorize_user


  def index
    @appearances = Appearance.all
  end

  def show
    @appearance = Appearance.find(params[:id])
  end

  def new
    @appearance = Appearance.new
  end

  def create
    @appearance = Appearance.create(appearance_params)
    if @appearance.save
      redirect_to appearance_path(@appearance)
    else
      render :new
    end
  end

  private
  def appearance_params
    params.require(:appearance).permit(:guest_id, :episode_id, :rating)
  end
end
