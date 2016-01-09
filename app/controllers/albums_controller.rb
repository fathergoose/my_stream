class AlbumsController < ApplicationController
  def index
    @albums = Album.where user_id: current_user
  end

  def show
    @album = Album.find_by id: params[:id]
  end
end
