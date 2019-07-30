# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Seeding"


options_hash = {col_sep: ",", headers: true,
  header_converters: :symbol, converters: :numeric}

olympians = CSV.open('db/data/olympic_data_2016.csv', options_hash)

oly_hashes = olympians.map{ |row| row.to_hash }

oly_hashes.each do |hash|

  olympian = Athlete.find_or_create_by(hash.slice(:name, :sex, :height, :weight, :age, :team))
  sport = Sport.find_or_create_by(name: hash[:sport])
  year, season = hash[:games].split(" ")
  game = Game.find_or_create_by(year: year, season: season)
  event = Event.find_or_create_by(sport: sport, name: hash[:event])
  EventParticipation.create(athlete: olympian, game: game, event: event, medal: hash[:medal])

end
