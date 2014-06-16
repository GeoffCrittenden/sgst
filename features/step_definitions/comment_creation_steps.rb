Given(/^that an authenticated User is logged in$/) do
  @user = User.create(email: 'email@email.com',
                      first_name: 'First',
                      last_name: 'Last',
                      location: 'Chicago, IL',
                      password: 'password',
                      password_confirmation: 'password')
  visit('/')
  click_link('Login')
  fill_in('Email', with: 'email@email.com')
  fill_in('Password', with: 'password')
  click_button('Login!')
  page.should have_content('Logout')
end

Then(/^they should be able to submit a Comment form$/) do
  Suggestion.create(user_id: @user.id,
                    target: 'Target Entity',
                    title: 'Suggestion Title',
                    body: 'Suggestion Body',
                    score: 0,
                    local: true)
  visit('/')
  click_link('Target Entity (Chicago, IL) - Suggestion Title')
  click_link('Add a comment')
  fill_in('Comment', with: 'Great suggestion.  Keep at it.')
  click_button('Submit Your Comment')
end

Then(/^that Comment now exists$/) do
  Comment.all.count.should == 1
end