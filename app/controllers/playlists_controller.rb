class PlaylistsController < ApplicationController
  def index
    @playlists = Playlist.where user_id: current_user
  end

  def create
    puts params
    @playlist = Playlist.new(name: params[:name], user_id: current_user.id)
    if @playlist.save
      params[:tracks].each do |t|
        PlaylistTrack.create(track_id: t.id, playlist_id: @playlist.id)
      end
      render json: { playlist: @playlist }, status: 200
    else
      render json: { errors: @playlist.errors.full_messages }, status: 422
    end
  end

end
