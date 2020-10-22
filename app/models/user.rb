class User < ApplicationRecord
  #account security
  has_secure_password

  # table associations
  has_many :logbooks
  has_many :flights, :through => :logbooks

  def most_flown_aircraft
    flights
      .group(:aircraft)
      .count
      .max_by{|k,v| v}
    end
  def most_hours_aircraft
    flights
      .group(:aircraft)
      .sum(:flight_time)
      .max_by{|k,v| v}
  end
end
