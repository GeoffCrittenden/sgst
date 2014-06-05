Feature: user receives errors when incorrectly filling out signup form
  In order to tell a new user they have incorrectly filled in a field on the signup form
  The website
  Should inform them with error messages

  Scenario: if a user enters blank or invalid info
    When a user submits an invalid signup form
    Then their account is not created and they receive an error message