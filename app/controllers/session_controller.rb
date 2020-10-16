class SessionController < ApplicationController
  # shows login page
  def new
  end

  # logs in with details from login page
  def create
    # finds user with the entered email
    user = User.find_by :email => params[:email]
    # if this finds a user & the correct password is entered...
    if user.present? && user.authenticate(params[:password])
      # log in
      session[:user_id] = user.id
      # back to homepage. # TODO: redirect to Logbooks index
      redirect_to root_path
    # If username/password are invalid
    else
      # FLASH! ah-AAAH! (store error for use on next page only)
      flash[:error] = "Invalid username or password"
      # go back and try again
      redirect_to login_path
    end
  end

  # log out (dramatically.)
  def destroy
    # clear session
    session[:user_id] = nil
    # go back to home
    redirect_to root_path
  end
end
