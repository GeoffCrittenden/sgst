Feature: User authentication
  In order for the website to authenticate a User
  The application
  Should use ecrypted passwords

  Scenario: account password encryption
    Given that a user supplies a valid password
    Then it should be encrypted