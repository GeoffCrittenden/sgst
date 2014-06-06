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
    And they receive an invalid email error message

  Scenario: if a user enters an email address already in use
    When a user submits an email address already in use
    Then an account is not created
    And they receive an already taken email error message

  Scenario: if a user enters a single character for their first name
    When a user submits a single character first name
    Then their new user account is not created
    And they receive a first name too short error message

  Scenario: if a user enters a single character for their last name
    When a user submits a single character last name
    Then their new account is not created
    And they receive a last name too short error message

  Scenario: if a user enters a password under eight characters
    When a user submits a password under eight characters
    Then their user account is not created
    And they receive a password too short error message

  Scenario: if a user enters a password confirmation that does not match their password
    When a user submits a password confirmation that does not match their password
    Then a user account is not created
    And they receive a does not match password error message
