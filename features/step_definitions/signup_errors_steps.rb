When(/^a user submits a blank signup form$/) do
  @user_count = User.count
  visit('/')
  fill_in 'user_email', :with => ' '
  click_button('Create Account')
  user = { email:'', first_name: '', last_name: '', location: '', password: '', password_confirmation: '' }
  user.each { |field,value| fill_in "user_#{field}", :with => value }
  click_button('Create Your Account')
end

Then(/^no account is created$/) do
  User.count.should == @user_count
end

Then(/^they receive error messages$/) do
  page.should have_content "can't be blank"
end

When(/^a user submits an invalid email address$/) do
  @user_count = User.count
  visit('/')
  fill_in 'user_email', :with => 'email'
  click_button('Create Account')
  user = { first_name: 'First',
           last_name: 'Last',
           location: 'Smallville, KS',
           password: 'password',
           password_confirmation: 'password' }
  user.each { |field,value| fill_in "user_#{field}", :with => value }
  click_button('Create Your Account')
end

Then(/^their account is not created$/) do
  User.count.should == @user_count
end

Then(/^they receive an invalid email error message$/) do
  page.should have_content 'email address is invalid'
end

When(/^a user submits an email address already in use$/) do
  User.create(email: 'email@email.com',
              first_name: 'First',
              last_name: 'Last',
              location: 'Smallville, KS',
              password: 'password',
              password_confirmation: 'password')
  @user_count = User.count
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

Then(/^an account is not created$/) do
  User.count.should == @user_count
end

Then(/^they receive an already taken email error message$/) do
  page.should have_content 'already in use by another account'
end

When(/^a user submits a single character first name$/) do
  @user_count = User.count
  visit('/')
  fill_in 'user_email', :with => 'email@email.com'
  click_button('Create Account')
  user = { first_name: 'F',
           last_name: 'Last',
           location: 'Smallville, KS',
           password: 'password',
           password_confirmation: 'password' }
  user.each { |field,value| fill_in "user_#{field}", :with => value }
  click_button('Create Your Account')
end

Then(/^their new user account is not created$/) do
  User.count.should == @user_count
end

Then(/^they receive a first name too short error message$/) do
  page.should have_content 'is too short (minimum is 2 characters)'
end

When(/^a user submits a single character last name$/) do
  @user_count = User.count
  visit('/')
  fill_in 'user_email', :with => 'email@email.com'
  click_button('Create Account')
  user = { first_name: 'First',
           last_name: 'L',
           location: 'Smallville, KS',
           password: 'password',
           password_confirmation: 'password' }
  user.each { |field,value| fill_in "user_#{field}", :with => value }
  click_button('Create Your Account')
end

Then(/^their new account is not created$/) do
  User.count.should == @user_count
end

Then(/^they receive a last name too short error message$/) do
  page.should have_content 'is too short (minimum is 2 characters)'
end

When(/^a user submits a password under eight characters$/) do
  @user_count = User.count
  visit('/')
  fill_in 'user_email', :with => 'email@email.com'
  click_button('Create Account')
  user = { first_name: 'First',
           last_name: 'Last',
           location: 'Smallville, KS',
           password: 'passwor',
           password_confirmation: 'passwor' }
  user.each { |field,value| fill_in "user_#{field}", :with => value }
  click_button('Create Your Account')
end

Then(/^their user account is not created$/) do
  User.count.should == @user_count
end

Then(/^they receive a password too short error message$/) do
  page.should have_content 'must be at least 8 characters'
end

When(/^a user submits a password confirmation that does not match their password$/) do
  @user_count = User.count
  visit('/')
  fill_in 'user_email', :with => 'email@email.com'
  click_button('Create Account')
  user = { first_name: 'First',
           last_name: 'Last',
           location: 'Smallville, KS',
           password: 'password',
           password_confirmation: 'passwordd' }
  user.each { |field,value| fill_in "user_#{field}", :with => value }
  click_button('Create Your Account')
end

Then(/^a user account is not created$/) do
  User.count.should == @user_count
end

Then(/^they receive a does not match password error message$/) do
  page.should have_content "doesn't match Password"
end
