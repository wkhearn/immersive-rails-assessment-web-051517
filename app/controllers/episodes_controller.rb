class EpisodesController < ApplicationController
  before_action :authorize_user

  def index
    @episodes = Episode.all
  end

  def show
    @episode = Episode.find(params[:id])
  end
end
