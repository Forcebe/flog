class Flight < ApplicationRecord
  belongs_to :logbook, :optional => true
end
