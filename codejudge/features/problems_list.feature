Feature: Show list of problems
    An admin can see the list of problems

Background: 
    Given the admin is authenticated

Scenario: 
    Given the admin goes to the problems page
    Then they should see a list of problems

