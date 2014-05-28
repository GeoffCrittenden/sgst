# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

100.times do |n|
  User.create(email: Faker::Internet.email, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, location: Faker::Address.city, Faker::Address.state_abbr)  
  Suggestion.create(owner_id: n + 1, target: Faker::Company.name, title: Faker::Lorem.sentence, body: Faker::Lorem.sentences, score: rand(1..100), local: [true,false].shuffle[0])
  Comment.create(owner_id: rand(1..100), suggestion_id: rand(1..100), vote: [1,-1].shuffle[0], body: Faker::Lorem.sentences)
end
