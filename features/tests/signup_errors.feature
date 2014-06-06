Feature: user receives errors when incorrectly filling out signup form
  In order to tell a new user they have incorrectly filled in a field on the signup form
  The website
  Should inform them with error messages

  Scenario: if a user enters blank info
    When a user submits a blank signup form
    Then no account is created
    And they receive error messages

  Scenario: if a user enters an invalid email address
    When a user submits an invalid email address
    Then their account is not created
    And they receive an error message