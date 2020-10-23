class UsersController < ApplicationController
  before_action :check_for_login, :only => [:show, :by_month, :by_aircraft, :by_type]
  # User signup page
  def new
    # stores user shape for form helper
    @user = User.new
  end

  #creates user from user signup page details
  def create
    # fills out a user from params validated by user_params whitelist
    @user = User.new user_params
    # save the user. If it works...
    if @user.save
      # log in
      session[:user_id] = @user.id
      # go to logbooks.
      redirect_to logbooks_path
    #if the user won't save
    else
      #back to create page with errors displayed
      render :new
    end
  end

  #For statistics views, gets info to be displayed for current user
  def by_month
    @flights = @current_user.flights
  end

  def by_aircraft
    @flights = @current_user.flights
  end

  def by_type
    @flights = @current_user.flights
  end

  private
  # Whitelists what can go into params
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
