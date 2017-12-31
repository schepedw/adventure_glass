Feature: Checking out
  As a customer
  I want to order products

  Background:
    Given I have a non-empty shopping cart

  Scenario Outline: Viewing form fields on the pre-checkout page
    Given I <logged_in?>
    And the information I have already given includes <given_info>
    And my customer information is not complete
    When I visit the checkout page
    Then the <given_info> fields are pre-populated
    And I see fields for <available_fields>

    Examples:
      | logged_in?         | given_info | available_fields |
      | have logged in     | title, first name, last name, phone number, building number, street, apartment number, city, state, zip code | title, first name, last name, phone number, building number, street, apartment number, city, state, zip code|
      | have not logged in | |email, password, password confirmation, title, first name, last name, phone number, building number, street, apt or unit number, city, state, zip code|

  Scenario: Skipping user registration fields for users with complete info
    Given I have logged in
    And my customer information is complete
    When I visit the checkout page
    Then I won't see fields for title, first name, last name, phone number

  Scenario: Using the most recent shipping address
    Given I am the current user
    And I have a valid shipping address
    When I enter a new shipping address on the checkout page
    Then my updated address will be shown on the confirmation page

  Scenario: Viewing product summary on confirmation page
    Given I have logged in
    And my customer information is complete
    When I am viewing the confirmation page for my order
    Then I should see all of the products in my cart
    And I should see the product subtotal

  @javascript
  Scenario: Updating quantity on the confirmation page
    Given I have logged in
    And I am viewing the confirmation page for my order
    When I change the quantity of a product in my shopping cart
    Then the product in my cart will have the desired quantity

  @javascript
  Scenario: Updating quantity on the confirmation page
    Given I have logged in
    And I am viewing the confirmation page for my order
    When I change the quantity of a product in my shopping cart
    Then the subtotal of my shopping cart will be updated

  @javascript
  Scenario: Removing a product from an order
    Given I have logged in
    And I am viewing the confirmation page for my order
    When I click on "Remove"
    Then the product will be removed from my cart
    And the subtotal of my shopping cart will be updated

    #Scenario: Placing an order
    #Given I have logged in
    #And I am viewing the confirmation page for my order
    #When I click on "Place Order"
    #Then an order will be created

    #Scenario: Receiving confirmation email for order placement
    #Given I have logged in
    #And I am viewing the confirmation page for my order
    #Then I will receive an email confirming my order
    #When I click on "Place Order"

    #Scenario: Viewing my order summary
    #Given I have logged in
    #And I am viewing the confirmation page for my order
    #When I click on "Place Order"
    #Then I will be directed to my order summary page
