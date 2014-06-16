When(/^a user is not logged in$/) do
  visit('/')
  page.should have_content('Login')
end

When(/^they submit a suggestion$/) do
  click_button('Create Your First Suggestion!')
  fill_in('Target', with: 'Target Entity')
  fill_in('Title', with: 'Title of Suggestion')
  fill_in('Body', with: 'Suggestion body.')
  click_button('Submit Your Suggestion!')
end

Then(/^they are told to login or create an acocunt$/) do
  page.should have_content('Welcome to Suggestion Box. Please')
end

When(/^a user submits a blank suggestion form$/) do
  visit('/')
  click_button('Create Your First Suggestion!')
  click_button('Submit Your Suggestion!')
end

Then(/^no suggestion is created$/) do
  Suggestion.all.count.should == 0
end

Then(/^they receive the appropriate error messages$/) do
  page.should have_content('required')
end