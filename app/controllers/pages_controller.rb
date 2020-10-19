class PagesController < ApplicationController
  #homepage
  def home
    redirect_to logbooks_path if @current_user.present?
  end
end
