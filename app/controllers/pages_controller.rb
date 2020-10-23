class PagesController < ApplicationController
  #homepage. You shouldn't see it if you're logged in
  def home
    redirect_to logbooks_path if @current_user.present?
  end
end
