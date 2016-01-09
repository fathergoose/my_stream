class ArtistsController < ApplicationController
  def index
    @artists = Artist.where user_id: current_user
    p @artists
  end

  def show
  end
end
