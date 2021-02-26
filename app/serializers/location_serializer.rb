class LocationSerializer < ActiveModel::Serializer
  attributes :id, :name, :lat, :long, :trips
end
