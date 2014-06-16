Given(/^that a User is logged in$/) do
  User.create(email: 'email@email.com',
              first_name: 'First',
              last_name: 'Last',
              location: 'Chicago, IL',
              password: 'password',
              password_confirmation: 'password')
  visit('/')
  click_link('Login')
  fill_in('Email', with: 'email@email.com')
  fill_in('Password', with: 'password')
  click_button('Login!')
  page.should have_content('Logout')
end

Then(/^they should be able to submit a Suggestion form$/) do
  visit('/')
  click_button('Create Your Next Great Suggestion!')
  fill_in('Target', with: 'Target Entity')
  fill_in('Title', with: 'Title of Suggestion')
  fill_in('Body', with: 'Body of Suggestion')
  click_button('Submit Your Suggestion!')
end

Then(/^that Suggestion now exists$/) do
  Suggestion.last.target.should == 'Target Entity'
end