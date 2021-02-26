class Location < ApplicationRecord
  has_many :trips, dependent: :destroy
  validates_presence_of :lat, :long, :name
end
