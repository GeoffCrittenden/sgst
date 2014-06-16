Feature: Suggestion Creation
  In order to create a Suggestion
  A User
  Should be logged in and
  Should be able to fill in suggestion form and submit

  Scenario: a User creates a Suggestion
    Given that a User is logged in
    Then they should be able to submit a Suggestion form
    And that Suggestion now exists