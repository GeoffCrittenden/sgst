Given(/^that a new user fills in the form and clicks submit$/) do
  visit('/')
  fill_in 'user_email', :with => 'email@email.com'
  click_button('Create Account')
  user = { first_name: 'First',
           last_name: 'Last',
           location: 'Smallville, KS',
           password: 'password',
           password_confirmation: 'password' }
  user.each { |field,value| fill_in "user_#{field}", :with => value }
  click_button('Create Your Account')
end

Then(/^they should have an account$/) do
  User.find_by(email: 'email@email.com').should_not == nil
end
