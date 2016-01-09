class TracksController < ApplicationController
  def index
    if user_signed_in?
      @tracks = Track.user_tracks(current_user)
    else
      redirect_to '/pages/welcome'
    end
  end



  def create
  #  @track = Track.new(
  #    path: params["path"]
  #  )
    p current_user
    puts '#################params##############'
    p params
    @track = Track.new
    p @track
    @track.path = params[:path][0]
    @track.save
    puts '##################### track'
    p @track
    @track.save_tags!(@track.id, current_user)
    # render :new
    response = {
      "files": [
        {
          "name": "#{@track.title}",
          "format": "#{@track.file_format}",
          "size": "#{@track.file_size}",
          
          },
      ]
    }
    p response
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
