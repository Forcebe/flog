class User < ApplicationRecord
  #account security
  has_secure_password

  # table associations
  has_many :logbooks
  has_many :flights, :through => :logbooks


  # Figures out the most flown aircraft for a user for access in a view
  def most_flown_aircraft
    flights
      .group(:aircraft)
      .count
      .max_by{|k,v| v}
    end
  # Figures out the aircraft with the most flown hours for a user for access in
  # a view 
  def most_hours_aircraft
    flights
      .group(:aircraft)
      .sum(:flight_time)
      .max_by{|k,v| v}
  end
end
