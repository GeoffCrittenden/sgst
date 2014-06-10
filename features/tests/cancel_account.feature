Feature: account cancellation
  In order to cancel their account
  A User
  Should be able to click a cancel link on their account page

  Scenario: a user wants to cancel their account
    Then their account page should have a 'cancel your account' link
    When they click on 'cancel your account' on their user page they should see an 'are you sure' message
    When they click 'yes' their account is destroyed
