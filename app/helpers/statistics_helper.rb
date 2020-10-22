module StatisticsHelper
  def user_hours_by_month
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

  def user_hours_by_aircraft
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

  def logbook_hours_by_month
    line_chart logbook_hours_by_month_charts_path, library: {
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
end
