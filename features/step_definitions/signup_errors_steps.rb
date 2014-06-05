When(/^a user submits an invalid signup form$/) do
  @user = User.create(email:'',
                      first_name: '',
                      last_name: '',
                      location: '',
                      password: '',
                      password_confirmation: '')
end

Then(/^their account is not created and they receive an error message$/) do
  p @user.errors.empty? == false
end
