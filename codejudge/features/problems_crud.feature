Feature: Add, edit, and remove problem
    An admin can add, edit, and remove a problem

Background:
    Given the admin is authenticated
    And the admin goes to the problems page

Scenario: Add
    Given they click on the 'Add a Problem' button
    And they enter the problem details
    When they click on the 'Add' button
    Then the problem should be visible in the list

Scenario: Edit
    Given a certain problem exists
    And they click on the 'Edit the problem' button of a certain problem
    And they enter the new values
    When they click on the 'Edit' button
    Then the problem should be updated to the new values

Scenario: Remove
    Given a certain problem exists
    And they click on the 'Remove the problem' button of a certain problem
    When they click on the 'Remove' button
    Then the problem should not be visible in the list any more