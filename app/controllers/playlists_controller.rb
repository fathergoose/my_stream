class PlaylistsController < ApplicationController
  def index
    @playlists = Playlist.where user_id: current_user
  end
end
