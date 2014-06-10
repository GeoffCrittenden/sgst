Given(/^that a user supplies a valid password$/) do
  @user = User.create(email: 'email@email.com',
                      first_name: 'First',
                      last_name: 'Last',
                      location: 'Chicago, IL',
                      password: 'password',
                      password_confirmation: 'password')
  User.find_by(email: 'email@email.com').password.should == 'password'
end

Then(/^it should be encrypted$/) do
  User.find_by(email: 'email@email.com').password_digest.should_not == 'password'
end
