class TripSerializer < ActiveModel::Serializer
  attributes :id, :name, :content, :user_id, :location_id, :date
end
