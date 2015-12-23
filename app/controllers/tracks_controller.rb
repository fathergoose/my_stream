class TracksController < ApplicationController
  def index
  end

  def new
  end

  def create
  #  @track = Track.new(
  #    path: params["path"]
  #  )
    @track = Track.new
    @track.path = params[:path]
    @track.save
    p @track
    redirect_to '/tracks'
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
