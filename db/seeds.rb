puts "Deleting old data..."
Trip.delete_all
Location.delete_all

puts "Building a few locations..."
new_york = Location.create(name: "NYC", lat: 40.71, long: -74.00)
phoenix = Location.create(name: "Phoenix AZ", lat: 33.45, long: -112.07)
north_pole = Location.create(name: "North Pole / Santa's Workshop", lat: 0, long: 89)
south_pole = Location.create(name: "South Pole / Penguin's Workshop", lat: 0, long: -89)

puts "Building a few trips..."
Location.all.each do |location|
  location.trips.create(name: "My Trip to #{location.name}", content: "OMG I HAD THE BEST TIME IN #{location.name} IT WAS SO GOOOOOOOOOOD!", date: Date.today)
end

puts "And done!"
