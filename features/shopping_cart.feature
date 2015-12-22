Feature: Shopping cart
  As a customer
  I should be able to aggregate the products that I want to purchase

  Background:
    Given I am the current user

  Scenario:
    Given I'm on a product page
    When I click on "I want one!"
    Then that product will be added to my shopping cart

  Scenario:
    Given I'm on a product page
    And I want to purchase more than one of that product
    When I click on "I want one!"
    Then the product added to my cart will have the desired quantity

  @javascript
  Scenario:
    Given I'm viewing my non-empty shopping cart
    When I change the quantity of a product in my shopping cart
    Then the subtotal of my shopping cart will be updated

  Scenario:
    Given I'm viewing my shopping cart
    When I click on "Remove"
    Then the product will be removed from my cart
    And the subtotal of my shopping cart will be updated

  Scenario:
    Given I have a shopping cart
    When I try to view someone else's shopping cart
    Then I am redirected home

  Scenario:
    Given I have a shopping cart
    When I try to remove a product from someone else's shopping cart
    Then the product is not removed from the cart

  Scenario:
    Given I have a shopping cart
    When I try to update product quantity in someone else's shopping cart
    Then no shopping cart is updated
