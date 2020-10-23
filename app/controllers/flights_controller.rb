class FlightsController < ApplicationController
  # can't access flights without being logged in
  before_action :check_for_login
  # Show all flights (for a logbook)
  def index
  end
  # Create a new flight
  def new
    @logbook = Logbook.find params[:logbook_id]
    @flight = Flight.new
  end
  #Creates a flight with parameters from new
  def create
    logbook = Logbook.find params[:logbook_id]
    @flight = Flight.new flight_params
    if @flight.save
      logbook.flights << @flight
      redirect_to logbook_path(logbook)
    else
      render :new
    end
  end
  # Edit a flight
  def edit
    @logbook = Logbook.find params[:logbook_id]
    @flight = Flight.find params[:id]
  end
  #Updates a flight with parameters from edit
  def update
    logbook = Logbook.find params[:logbook_id]
    flight = Flight.find params[:id]
    flight.update flight_params
    redirect_to logbook_path(logbook)
  end
  # Deletes a flight
  def destroy
    logbook = Logbook.find params[:logbook_id]
    flight = Flight.find params[:id]
    flight.destroy
    redirect_to logbook_path(logbook)
  end
  # Whitelist for things that can be included in a flight
  private
  def flight_params
    params.require(:flight).permit(:date, :aircraft, :registration, :night, :multi, :command, :flight_time, :instrument_time, :notes, :location, :launch_type, :serial, :freefall, :launch_altitude, :distance)
  end
end
