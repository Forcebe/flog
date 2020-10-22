class ChartsController < ApplicationController
  def user_hours_by_month
    result = @current_user.flights.group_by_month(:date, format: "%b %Y").sum(:flight_time)
    render json: [{name: 'Flight Hours', data: result}]
  end

  def user_hours_by_aircraft
    result = @current_user.flights.group(:aircraft).sum(:flight_time)
    render json: [{name: 'Flight Hours', data: result}]
  end

    #TODO figure out the query for this bastard of a thing
  # def user_flights_by_type
  #   #find key value pairs of aviation_type => flights.count
  #   result = @current_user.logbooks.group(:aviation_type).flights.size
  # end

  def logbook_hours_by_month(logbook)
    # TODO find out how to get current logbook
    result = logbook.flights.group_by_month(:date, format: "%b %Y").sum(:flight_time)
    render json: [{name: 'Flight Hours', data: result}]
  end

  def logbook_hours_by_aircraft
    # TODO find out how to get current logbook
    result = logbook.flights.group(:aircraft).sum(:flight_time)
    render json: [{name: 'Flight Hours', data: result}]
  end
end
