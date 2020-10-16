class ApplicationController < ActionController::Base
  #First, grab the current user, so you can use them on any page
  before_action :fetch_user

  private
  # Who's  logged in?
  def fetch_user
    #find the user who's id matches the session user id, if there is one
    @current_user = User.find_by :id => session[:user_id] if session[:user_id].present?
    #make sure there is no-one logged in without being identified
    session[:user_id] = nil unless @current_user.present?
  end

  # Is someone logged in?
  def check_for_login
    #if not, back home with you!
    redirect_to root path unless @current_user.present?
  end
end
