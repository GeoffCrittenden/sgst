Feature: Comment Creation
  In order to create a Comment
  A User
  Should be logged in and
  Should be able to fill in Comment form and submit

  Scenario: a User creates a Comment
    Given that an authenticated User is logged in
    Then they should be able to submit a Comment form
    And that Comment now exists