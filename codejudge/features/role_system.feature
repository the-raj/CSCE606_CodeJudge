Feature: Role System

Scenario: A student is trying to edit a problem
    Given the student is logged in
    When they try to edit a "problem"
    Then they should be redirected to an error page

Scenario: A student is trying to edit a user
    Given the student is logged in
    When they try to edit a "user"
    Then they should be redirected to an error page