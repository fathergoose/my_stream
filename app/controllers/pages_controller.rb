class PagesController < ApplicationController
  def welcome
  end

  def home
     redirect_to '/pages/welcome' unless user_signed_in?
  end
     
end
