Then(/^their account page should have a 'cancel your account' link$/) do
  @user = User.create(email: 'email@email.com',
                      first_name: 'First',
                      last_name: 'Last',
                      location: 'Smallville, KS',
                      password: 'password',
                      password_confirmation: 'password')
  visit("/users/#{@user.id}")
  page.should have_content "cancel your account"
end

When(/^they click on 'cancel your account' on their user page they should see an 'are you sure' message$/) do
  @user2 = User.create(email: 'email2@email.com',
                       first_name: 'First',
                       last_name: 'Last',
                       location: 'Smallville, KS',
                       password: 'password',
                       password_confirmation: 'password')
  visit("/users/#{@user2.id}")
  click_link('cancel your account')
  page.should have_content "Are you sure that you want to close your account?"
end

When(/^they click 'yes' their account is destroyed$/) do
  @user3 = User.create(email: 'email3@email.com',
                       first_name: 'First',
                       last_name: 'Last',
                       location: 'Smallville, KS',
                       password: 'password',
                       password_confirmation: 'password')
  visit("/users/#{@user3.id}")
  click_link('cancel your account')
  click_link('YES')
  User.find(@user3.id).should == nil
end
