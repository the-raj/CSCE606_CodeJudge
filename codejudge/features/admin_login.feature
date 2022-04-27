Feature: Admin Login
    An admin should be able to login

Scenario: Correct credentials provided
    Given the admin is on the login page
    Given the admin provides correct credentials
    When they click on the login button
    Then they should get a positive feedback
    And they can log out

Scenario: Incorrect credentials provided
    Given the admin is on the login page
    Given the admin provides incorrect credentials
    When they click on the login button
    Then they should get a negative feedback