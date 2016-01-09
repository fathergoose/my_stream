class AlbumsController < ApplicationController
  def index
    @albums = Album.where user_id: current_user
  end

  def show
  end
end
