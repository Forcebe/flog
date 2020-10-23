module StatisticsHelper
  # Creates the chart for user hours by month and adjusts settings
  def user_hours_by_month
    # Calls the charts controller to get the results and load the chart
    # asynchronously
    line_chart user_hours_by_month_charts_path, library: {
      title: {text: 'Hours by Month', x: -20},
      tooltip: {
        enabled: false,
      },
      yAxis: {
         title: {
             text: 'Hours flown'
         }
      }
    }
  end

  # Creates the chart for user hours by month and adjusts settings
  def user_hours_by_aircraft
    # Calls the charts controller to get the results and load the chart
    # asynchronously
    column_chart user_hours_by_aircraft_charts_path, library: {
      title: {text: 'Hours by Aircraft', x: -20},
      yAxis: {
          title: {
              text: 'Hours Flown'
          }
      },
      xAxis: {
          title: {
              text: 'Aircraft'
          }
      },
      data: {
        round: 1
      }
    }
  end

  def user_flights_by_type
    # Calls the charts controller to get the results and load the chart
    # asynchronously
    bar_chart user_flights_by_type_charts_path, library: {
      title: {text: 'Hours by Aircraft', x: -20},
      xAxis: {
          title: {
              text: 'Aviation Type'
          }
      },
      data: {
        round: 1
      }
    }
  end

  # Creates the chart for user hours by month and adjusts settings
  def logbook_hours_by_month
    # Calls the charts controller to get the results and load the chart
    # asynchronously
    line_chart logbook_hours_by_month_charts_path(:id => params[:id]), library: {
      title: {text: 'Hours by Month', x: -20},
      tooltip: {
        enabled: false,
      },
      yAxis: {
         title: {
             text: 'Hours flown'
         }
      }
    }
  end

  def logbook_jumps_by_month
    # Calls the charts controller to get the results and load the chart
    # asynchronously
    line_chart logbook_jumps_by_month_charts_path(:id => params[:id]), library: {
      title: {text: 'Jumps by Month', x: -20},
      tooltip: {
        enabled: false,
      },
      yAxis: {
         title: {
             text: 'Jumps made'
         }
      }
    }
  end

  def logbook_hours_by_aircraft
    # Calls the charts controller to get the results and load the chart
    # asynchronously
    column_chart logbook_hours_by_aircraft_charts_path(:id => params[:id]), library: {
      title: {text: 'Hours by Aircraft', x: -20},
      tooltip: {
        enabled: false,
      },
      yAxis: {
         title: {
             text: 'Hours flown'
         }
      }
    }
  end

  def logbook_jumps_by_canopy
    # Calls the charts controller to get the results and load the chart
    # asynchronously
    column_chart logbook_jumps_by_canopy_charts_path(:id => params[:id]), library: {
      title: {text: 'Jumps by Canopy', x: -20},
      },
      yAxis: {
         title: {
             text: 'Jumps Made'
         }
      }
  end
end
