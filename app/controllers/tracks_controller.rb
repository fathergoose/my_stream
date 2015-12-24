class TracksController < ApplicationController
  def index
    @tracks = Track.all
  end

  def new
  end

  def create
  #  @track = Track.new(
  #    path: params["path"]
  #  )
    @track = Track.new
    @track.path = params[:file]
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
