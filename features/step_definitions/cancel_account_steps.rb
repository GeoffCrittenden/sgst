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

When(/^they click on 'cancel your account' on their user page$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^they should see an 'are you sure' message$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^they click 'yes'$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^their account is destroyed$/) do
  pending # express the regexp above with the code you wish you had
end