Feature: Base model crud
  As an admin
  I want to view, create, edit, and delete base models

  Background:
    Given I am signed in as an admin

  Scenario: Deleting a base model
    Given I am editing a base model
    Then the base model and associated pictures will be deleted
    When I click the "Delete" button

  @javascript
  Scenario: Editing a specification for a base model
    Given I am editing a base model that has at least one specification
    When I update a specification for that base model
    Then the updated specification will be persisted

  @javascript
  Scenario: Adding a specification for a base model
    Given I am editing a base model
    When I add a specification for that base model
    Then the new specification will be persisted

  @javascript
  Scenario: Removing a specification for a base model
    Given I am editing a base model that has at least one specification
    Then the specifcation is removed
    When I remove that specification

  @javascript
  Scenario: Editing a option for a base model
    Given I am editing a base model that has at least one option
    When I update the description of that option
    Then the updated option will be persisted

  @javascript
  Scenario: Editing a option for a base model
    Given I am editing a base model that has at least one option
    When I update the price of that option
    Then the updated option will be persisted

  @javascript
  Scenario: Adding a option for a base model
    Given I am editing a base model
    When I add a option for that base model
    Then the new option will be persisted

  @javascript
  Scenario: Removing a option for a base model
    Given I am editing a base model that has at least one option
    Then the option is removed
    When I remove that option

  @javascript
  Scenario: Adding a picture to a base model
    Given I am editing a base model
    When I add a picture
    Then that picture will be persisted

  @javascript
  Scenario: Removing a picture from a base model
    Given I am editing a base model
    Then a picture will be deleted
    When I remove a picture
