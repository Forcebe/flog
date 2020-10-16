class UsersController < ApplicationController
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
      session[:user_id] = @user.idea
      # go home. TODO: go to logbooks index
      redirect_to root_path
    #if the user won't save
    else
      #back to create page with errors displayed
      render :new
    end
  end

  private
  # Whitelists what can go into params
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end