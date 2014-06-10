Then(/^their account page should have a 'cancel your account' link$/) do
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
  @id = User.last.id
  @count = User.count
  page.should have_content "cancel your account"
end

When(/^they click on 'cancel your account' on their user page they should see an 'are you sure' message$/) do
  click_link('cancel your account')
  page.should have_content "Are you sure that you want to close your account?"
end

When(/^they click 'yes' their account is destroyed$/) do
  click_link('YES')
  User.count.should < @count
end
