class LogbooksController < ApplicationController
  before_action :check_for_login

  def index
    @logbooks = @current_user.logbooks
  end

  def show
    @logbook =Logbook.find params[:id]
    @flights = @logbook.flights
    redirect_to logbooks_path if @logbook.user_id != @current_user.id
  end

  def new
    @logbook = Logbook.new
  end

  def create
    @logbook = Logbook.new logbook_params
    if @logbook.save
      @current_user.logbooks << @logbook
      redirect_to logbooks_path
    else
      render :new
    end
  end

  def edit
    @logbook =Logbook.find params[:id]
  end

  def update
    logbook = Logbook.find params[:id]
    logbook.update logbook_params
    redirect_to logbooks_path
  end

  def destroy
    logbook = Logbook.find params[:id]
    logbook.destroy
    redirect_to logbooks_path
  end

  def by_month
    @logbook =Logbook.find params[:id]
    @flights = @logbook.flights
  end

  def by_aircraft
    @logbook =Logbook.find params[:id]
    @flights = @logbook.flights
  end

  private
  def logbook_params
    params.require(:logbook).permit(:name, :aviation_type, :id)
  end
end
