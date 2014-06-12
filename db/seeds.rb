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
4.times do
  100.times do |n|
    Suggestion.create(user_id: n + 1,
                      target: Faker::Company.name,
                      title: Faker::Lorem.sentence,
                      body: Faker::Lorem.paragraph,
                      score: 1,
                      local: [true,false].shuffle[0])
  end
end
5.times do
  100.times do |n|
    Comment.create(user_id: rand(1..100),
                   suggestion_id: n + 1,
                   vote: [1,-1].shuffle[0],
                   body: Faker::Lorem.paragraph)
  end
end

Suggestion.all.each { |s| s.update_score! }
