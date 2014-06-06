When(/^a user submits a blank signup form$/) do
  @user = User.create(email:'',
                      first_name: '',
                      last_name: '',
                      location: '',
                      password: '',
                      password_confirmation: '')
end

Then(/^no account is created$/) do
  User.find_by(email: '').should == nil
end

Then(/^they receive error messages$/) do
  @user.errors.empty?.should == false
end

When(/^a user submits an invalid email address$/) do
  visit('/')
  fill_in 'user_email', :with => 'email'
  click_button('Create Account')
  user = { email: 'email',
           first_name: 'first',
           last_name: 'Last',
           location: 'Smallville, KS',
           password: 'password',
           password_confirmation: 'password' }
  user.each { |field,value| fill_in "user_#{field}", :with => value }
  click_button('Create Your Account')
end

Then(/^their account is not created$/) do
  User.find_by(email: 'email').should == nil
end

Then(/^they receive an error message$/) do
  page.should have_content 'is invalid'
end
