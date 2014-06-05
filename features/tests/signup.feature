Feature: user signup
  In order to create a new account
  A User
  Should be able to fill out the signup form and submit

  Scenario: when a user signs up
    Given that a new user fills in the form
    When user clicks signup
    Then they should have an account
