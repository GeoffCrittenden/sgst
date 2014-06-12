# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

100.times do
  User.create(email: Faker::Internet.email,
              first_name: Faker::Name.first_name,
              last_name: Faker::Name.last_name,
              location: "#{Faker::Address.city}, #{Faker::Address.state_abbr}",
              password: 'password',
              password_confirmation: 'password')
end

User.all.each do |u|
  4.times do
    Suggestion.create(user_id: u.id,
                      target: Faker::Company.name,
                      title: Faker::Lorem.sentence,
                      body: Faker::Lorem.paragraph,
                      score: 0,
                      local: [true,false].shuffle[0])
  end
end

Suggestion.all.each do |s|
  5.times do
    Comment.create(user_id: rand(1..100),
                   suggestion_id: s.id,
                   vote: [0,1].shuffle[0],
                   body: Faker::Lorem.paragraph)
  end
end

Suggestion.all.each { |s| s.update_score! }
