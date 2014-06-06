When(/^a user submits an invalid signup form$/) do
  @user = User.create(email:'email',
                      first_name: '',
                      last_name: '',
                      location: '',
                      password: '',
                      password_confirmation: '')
end

Then(/^their account is not created$/) do
  User.find_by(email: 'email').should == nil
end

Then(/^they receive an error message$/) do
  @user.errors.empty?.should == false
end
