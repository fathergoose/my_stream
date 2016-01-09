class ArtistsController < ApplicationController
  def index
    @artists = Artist.where user_id: current_user
    p @artists
  end

  def show
    @artist = Artist.find_by id: params[:id]
  end
end
