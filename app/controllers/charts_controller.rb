class ChartsController < ApplicationController
  #This controller works out the results and puts them in the chart
  def user_hours_by_month
    #Finds flights, groups by month, formats and gets a sum of flight time
    result = @current_user.flights.group_by_month(:date, format: "%b %Y").sum(:flight_time)
    render json: [{name: 'Flight Hours', data: result}]
  end
  #Finds flights, groups by aircraft, formats and gets a sum of flight time
  def user_hours_by_aircraft
    result = @current_user.flights.group(:aircraft).sum(:flight_time)
    render json: [{name: 'Flight Hours', data: result}]
  end

    # TODO figure out the query for this bastard of a thing
  def user_flights_by_type
    #find key value pairs of aviation_type => flights.count
    result = @current_user.flights.group(:aviation_type).count
    render json: [{name: 'Number of Flights', data: result}]
  end

  def logbook_hours_by_month
    # TODO find out how to get current logbook
    logbook = Logbook.find(params[:id])
    result = logbook.flights.group_by_month(:date, format: "%b %Y").sum(:flight_time)
    render json: [{name: 'Flight Hours', data: result}]
  end

  def logbook_jumps_by_month
    # TODO find out how to get current logbook
    logbook = Logbook.find(params[:id])
    result = logbook.flights.group_by_month(:date, format: "%b %Y").count
    render json: [{name: 'Jumps Made', data: result}]
  end

  def logbook_hours_by_aircraft
    # TODO find out how to get current logbook
    logbook = Logbook.find(params[:id])
    result = logbook.flights.group(:aircraft).sum(:flight_time)
    render json: [{name: 'Flight Hours', data: result}]
  end

  def logbook_jumps_by_canopy
    # TODO find out how to get current logbook
    logbook = Logbook.find(params[:id])
    result = logbook.flights.group(:aircraft).count
    render json: [{name: 'Jumps Made', data: result}]
  end
end
