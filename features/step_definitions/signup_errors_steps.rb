Given(/^that the user gives an incorrect input$/) do
  @user = User.new(email: '',
                      first_name: '',
                      last_name: '',
                      location: '',
                      password: '',
                      password_confirmation: '')
end

When(/^the user clicks submit$/) do
  @user.save
end

Then(/^their account is not created and they receive an error message$/) do
  p @user.errors
  @user.errors.empty? == false
end