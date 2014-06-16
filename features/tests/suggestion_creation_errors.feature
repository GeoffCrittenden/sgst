Feature: user receives errors when incorrectly filling out suggestion form
  In order to tell a new user they have incorrectly filled in a field on the suggestion form
  The website
  Should inform them with error messages

  Scenario: if a user creates a suggestion while not logged in
    When a user is not lgged in
    When they submit a suggestion
    Then they are told to login or create an acocunt

  Scenario: if a user enters blank info
    When a user submits a blank signup form
    Then no suggestion is created
    And they receive error messages
