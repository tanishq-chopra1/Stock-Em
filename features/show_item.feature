Feature: Show Item
  As a user
  I want to log in via Google OAuth and view the details of a specific item
  So that I can see all relevant information about it

  Scenario: Successful login via Google OAuth and viewing an item
    Given I am on the home page
    When I click on "Login with Google"
    And I successfully authenticate via Google
    Then I should be redirected to my user page
    And I am an admin user
    And I should see "Howdy,"
    Given there is an item in the database
    When I visit the item page
    Then I should see the item's details

  Scenario: Successfully updating item status to 'Damaged' as Admin
    Given I am on the home page
    When I click on "Login with Google"
    And I successfully authenticate via Google
    And I am an admin user
    Then I should be redirected to my user page
    And I should see "View Items"
    Given there is an item in the database
    When I visit the item page
    Given I have an item named "Test Item" with status "Available"
    And I select "Damaged" from the status dropdown
    And I click on "Update Status"
    And the item status should be "Damaged"

  Scenario: Successfully clearing the item status as Admin
    Given I am on the home page
    When I click on "Login with Google"
    And I successfully authenticate via Google
    And I am an admin user
    Then I should be redirected to my user page
    And I should see "View Items"
    Given there is an item in the database
    When I visit the item page
    Given I have an item named "Test Item" with status "Available"
    And I select "Damaged" from the status dropdown
    And I click on "Update Status"
    And I select "Clear Status" from the status dropdown
    And I click on "Update Status"
    And the item status should be ""

  Scenario: Successfully updating item status to 'Damaged' as Assistant
    Given I am on the home page
    When I click on "Login with Google"
    And I successfully authenticate via Google
    And I am an assistant user
    Then I should be redirected to my user page
    And I should see "View Items"
    Given there is an item in the database
    When I visit the item page
    Given I have an item named "Test Item" with status "Available"
    And I select "Damaged" from the status dropdown
    And I click on "Update Status"
    And the item status should be "Damaged"

  Scenario: Successfully clearing the item status as Assistant
    Given I am on the home page
    When I click on "Login with Google"
    And I successfully authenticate via Google
    And I am an assistant user
    Then I should be redirected to my user page
    And I should see "View Items"
    Given there is an item in the database
    When I visit the item page
    Given I have an item named "Test Item" with status "Available"
    And I select "Damaged" from the status dropdown
    And I click on "Update Status"
    And I select "Clear Status" from the status dropdown
    And I click on "Update Status"
    And the item status should be ""

  Scenario: Failing to update item status to 'Damaged' as a Student
    Given I am on the home page
    When I click on "Login with Google"
    And I successfully authenticate via Google
    Then I should be redirected to my user page
    And I should see "View Items"
    Given there is an item in the database
    When I visit the item page
    Given I have an item named "Test Item" with status "Lost"
    Then I should not see "Update Status"

  Scenario: Failing to clear the item status as a Student
    Given I am on the home page
    When I click on "Login with Google"
    And I successfully authenticate via Google
    Then I should be redirected to my user page
    And I should see "View Items"
    Given there is an item in the database
    When I visit the item page
    Given I have an item named "Test Item" with status "Lost"
    Then I should not see "Update Status"
