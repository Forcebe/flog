class Logbook < ApplicationRecord
  has_many :flights
  belongs_to :user, :optional => true
end
