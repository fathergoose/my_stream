class PagesController < ApplicationController
  def welcome
    render layout: "welcome"
  end

  def home
    authenticate_user!
    #  redirect_to '/pages/welcome' unless user_signed_in?
  end

  def upload
    redirect_to '/pages/welcome' unless user_signed_in?
  end

end
