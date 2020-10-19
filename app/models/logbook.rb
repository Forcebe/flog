class Logbook < ApplicationRecord
  has_many :flights
  belongs_to :user, :optional => true
  validates :aviation_type, inclusion: { in: ['General Aviation', 'Gliding', 'Free Flight', 'Skydiving'], message: "invalid"}
end
