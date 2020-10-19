class FlightsController < ApplicationController
  before_action :check_for_login

  def index
  end

  def new
    @logbook = Logbook.find params[:logbook_id]
    @flight = Flight.new
  end

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

  def edit
    @logbook = Logbook.find params[:logbook_id]
    @flight = Flight.find params[:id]
  end

  def update
    logbook = Logbook.find params[:logbook_id]
    flight = Flight.find params[:id]
    flight.update flight_params
    redirect_to logbook_path(logbook)
  end

  def destroy
    logbook = Logbook.find params[:logbook_id]
    flight = Flight.find params[:id]
    flight.destroy
    redirect_to logbook_path(logbook)
  end

  private
  def flight_params
    params.require(:flight).permit(:date, :aircraft, :registration, :night, :multi, :command, :flight_time, :instrument_time, :notes, :location, :launch_type, :serial, :freefall, :launch_altitude, :distance)
  end
end
