Feature: Adding tasks to a list
  In order to add or remove a task from a list
  As a authenticated user
  I want show or hide the task fields

  @javascript
  Scenario: Add a task
    Given I do my login
    And   visit the link 'My Tasks Lists'
    And   visit the link 'New list'
    When  I click on the link 'Add a task'
    Then  I should see the task fields

  @javascript
  Scenario: Remove a task
    Given I do my login
    And   visit the link 'My Tasks Lists'
    And   visit the link 'New list'
    When  I click on the link 'Remove'
    Then  I should hidden the task

