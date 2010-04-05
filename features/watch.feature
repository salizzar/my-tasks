Feature: Watching Public Lists
  In order to watch or unwatch a list
  As a authenticated user
  I want see a successfully message

  Scenario: Watch a List
    Given Im at 'My Public Lists'
    When  I click on the link Watch
    Then  I should see 'List was successfully watched.'

  Scenario: Unwatch a List
    Given Im at 'My Public Lists'
    When  I click on the link Unwatch
    Then  I should see 'List was successfully unwatched.'

