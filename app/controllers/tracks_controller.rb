class TracksController < ApplicationController
  def index
    if user_signed_in?
      @tracks = Track.user_tracks(current_user)
    else
      redirect_to '/pages/welcome'
    end
  end



  def create
    @track = Track.new
    @track.path = params[:path][0]
    @track.save
    @track.save_tags!(@track.id, current_user)
    response = {
      "files": [
        {
          "name": "#{@track.title}",
          "format": "#{@track.file_format}",
          "size": "#{@track.file_size}",
          
          },
      ]
    }
    render json: response
  end

  def show
    @track = Track.find_by id: params[:id]
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
