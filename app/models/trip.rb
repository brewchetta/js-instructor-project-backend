class Trip < ApplicationRecord
  belongs_to :location
  validates_presence_of :name, :content
end
