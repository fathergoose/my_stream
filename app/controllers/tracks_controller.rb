class TracksController < ApplicationController
  def index
    if user_signed_in?
      @tracks = Track.user_tracks(current_user)
    else
      redirect_to '/pages/welcome'
    end
  end


  def new
  end

  def create
  #  @track = Track.new(
  #    path: params["path"]
  #  )
    p current_user
    @track = Track.new(user_id: current_user.id)
    @track.path = params[:path]
    @track.save
    p @track
    @track.save_tags!(@track.id)
    render :new
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
