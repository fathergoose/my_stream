class PlaylistsController < ApplicationController
  def index
    @playlists = Playlist.where user_id: current_user
  end

  def create
    @playlist = Playlist.new(name: params[:name],  tracks: params[:tracks])
    if @task.save
      render status: 200
    else
      render json: { errors: @task.errors.full_messages }, status: 422
    end
  end

end
