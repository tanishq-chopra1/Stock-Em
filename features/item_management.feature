Feature: Item Management
  As a user
  I want edit and delete items

  Scenario: Edit Name of the Item with Save with Admin Login
    Given I am logged in
    And I am an admin user
    And I am on the item details page
    When I select "Edit"
    And I set field "Item Name" to "Newest Item Name"
    When I select "Save"
    And I should see "Newest Item Name"
    And I should see "Item was successfully updated."

  Scenario: Edit quality of item with invalid value and save with Admin Login
    Given I am logged in
    And I am an admin user
    And I am on the item details page
    When I select "Edit"
    And I set field "Quality Score" to "-19"
    And I select "Save"
    And I should not see "-19"
    And I should not see "Item was successfully updated."
    And I should see "There was a problem updating the item."

  Scenario: Edit Name of the Item with Cancel with Admin Login
    Given I am logged in
    And I am an admin user
    And I am on the item details page
    When I select "Edit"
    And I set field "Item Name" to "Not new item"
    When I select "Cancel"
    And I should not see "Not new item"
    And I should not see "Item was successfully updated."

  Scenario: Edit Quality Score of Item with Admin Login
    Given I am logged in
    And I am an admin user
    And I am on the item details page
    When I select "Edit"
    And I set field "Quality Score" to "19"
    And I select "Save"
    And I should see "19"
    And I should see "Item was successfully updated."

  Scenario: Trying to Edit with Assistant Login
    Given I am logged in
    And I am an assistant user
    And I am on the item details page
    Then I should not see "Edit"

  Scenario: Trying to Edit with Student Login
    Given I am logged in
    And I am a student user
    And I am on the item details page
    Then I should not see "Edit"

  Scenario: Delete an item with Admin Login
    Given I am logged in
    And I am an admin user
    And I am on the item details page
    When I select "Delete"
    Then I should see "Item was successfully deleted."
    And I should not see "Item Name" in the item list

  @javascript
  Scenario: Delete an item with Assistant Login
    Given I am logged in
    And I am an assistant user
    And I am on the item details page
    Then I should not see "Delete"

  @javascript
  Scenario: Delete an item with Student Login
    Given I am logged in
    And I am a student user
    And I am on the item details page
    Then I should not see "Delete"

  Scenario: Update all item fields
    Given I am logged in
    And I am an admin user
    And I am on the item details page
    When I select "Edit"
    And I set field "Item Name" to "New Item Name"
    And I set field "Category" to "Electronics"
    And I set field "Status" to "Lost"
    And I set field "Quality Score" to "75"
    And I set field "Details" to "This is a detailed description"
    And I select "Save"
    Then I should see "New Item Name"
    And I should see "75"
    And I should see "Electronics"
    And I should see "Lost"
    And I should see "This is a detailed description"
    And I should see "Item was successfully updated."