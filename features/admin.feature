Feature: Login as admin
  As an admin
  I want to edit roles for users

  Scenario: Successfully logging as an admin
    Given I am on the home page
    Given an admin with username "admin" and password "admin" exists
    When I click on "Login as Admin"
    Then I should be on the 'Admin Login' page
    And I should see "Admin Login"
    And I fill in "username" with "admin"
    And I fill in "password" with "admin"
    And I click on "Login as Admin"
    Then I should be on the 'Dashboard' page
    And I should see "Users"

  Scenario: Successfully logging as an admin
    Given I am on the home page
    Given an admin with username "admin" and password "admin" exists
    Given some users exists
    When I click on "Login as Admin"
    Then I should be on the 'Admin Login' page
    And I should see "Admin Login"
    And I fill in "username" with "admin"
    And I fill in "password" with "admin"
    And I click on "Login as Admin"
    Then I should be on the 'Dashboard' page
    And I should see "Users"
    And I should see "random TA"

  @javascript
  Scenario: Successfully logging as an admin
    Given I am on the home page
    Given an admin with username "admin" and password "admin" exists
    Given some users exists
    When I click on "Login as Admin"
    Then I should be on the 'Admin Login' page
    And I should see "ADMIN LOGIN"
    And I fill in "username" with "admin"
    And I fill in "password" with "admin"
    And I click on "Login as Admin"
    Then I should be on the 'Dashboard' page
    And I should see "Users"
    And I should see "random TA"
    When I edit the user’s role to "Student"
    And I press "Save"
    Then I should see "Student"
    And I click on "Logout"
    Then I should be on the 'Admin Login' page


