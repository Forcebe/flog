class LogbooksController < ApplicationController
  before_action :check_for_login
  # shows the current user's logbook
  def index
    @logbooks = @current_user.logbooks
  end
  #Show a particular logbook
  def show
    @logbook =Logbook.find params[:id]
    @flights = @logbook.flights
    redirect_to logbooks_path if @logbook.user_id != @current_user.id
  end
  # Form for a new logbook
  def new
    @logbook = Logbook.new
  end
  # Create a new logbook from the form 'new'
  def create
    @logbook = Logbook.new logbook_params
    # If it saves, add to current user logbooks
    if @logbook.save
      @current_user.logbooks << @logbook
      # go back to logbooks index
      redirect_to logbooks_path
      # if it won't save, go back to the form
    else
      render :new
    end
  end
  # Form to edit an existing logbook
  def edit
    @logbook =Logbook.find params[:id]
  end
  # Updates logbooks from the form edit
  def update
    logbook = Logbook.find params[:id]
    logbook.update logbook_params
    redirect_to logbooks_path
  end
  # deletes a logbook
  def destroy
    logbook = Logbook.find params[:id]
    logbook.destroy
    redirect_to logbooks_path
  end
  # Shows statistics for a logbook by month
  def by_month
    @logbook =Logbook.find params[:id]
    @flights = @logbook.flights
  end
  # Shows statistics for a logbook by aircraft
  def by_aircraft
    @logbook =Logbook.find params[:id]
    @flights = @logbook.flights
  end
  # Whitelist the stuff that can go into a logbook
  private
  def logbook_params
    params.require(:logbook).permit(:name, :aviation_type, :id)
  end
end
