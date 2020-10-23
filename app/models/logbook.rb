class Logbook < ApplicationRecord
  has_many :flights
  belongs_to :user, :optional => true
  # These are the only values allowed for logbook => aviation_type
  validates :aviation_type, inclusion: { in: ['General Aviation', 'Gliding', 'Free Flight', 'Skydiving'], message: "invalid"}

  # Figures out the most flown aircraft for a logbook for access in a view
  def most_flown_aircraft
    flights
      .group(:aircraft)
      .count
      .max_by{|k,v| v}
    end
  # Figures out the aircraft with the most flown hours for a logbook for access in
  # a view
  def most_hours_aircraft
    flights
      .group(:aircraft)
      .sum(:flight_time)
      .max_by{|k,v| v}
  end

  def most_freefall_canopy
    flights
      .group(:aircraft)
      .sum(:freefall)
      .max_by{|k,v| v}
  end
end
