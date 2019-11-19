# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Station.create!(
  name: "yokohama"
)
20.times do |i|
  AdminPost.create!(
    station_id: 1,
    data: i % 3,
    location: "場所の説明#{i}",
    lat: 123.4567899,
    lng: 123.4567899
  )
end
