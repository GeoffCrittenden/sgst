Given(/^that a new user fills in the form$/) do
  @user = User.new(email: 'example@email.com',
                   first_name: 'Bob',
                   last_name: 'Uncle',
                   location: 'London, UK',
                   password: 'password',
                   password_confirmation: 'password')
end

When(/^user clicks signup$/) do
  @user.save
end

Then(/^they should have an account$/) do
  User.find_by(email: 'example@email.com').should_not == nil
end
