class TripSerializer < ActiveModel::Serializer
  attributes :id, :location_id, :user_id, :name, :content, :date, :location
end
