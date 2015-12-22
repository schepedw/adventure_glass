Feature: Navigation bar
  As a customer
  I should be able to navigate the site quickly by using the navigation bar

  Scenario:
    Given I'm on the home page
    When I click on "Paddleboats"
    Then I'll be taken to the "paddleboats" page

  Scenario:
    Given I'm on the home page
    When I click on "Canoes"
    Then I'll be taken to the product page for "Canoe"

  Scenario:
    Given I'm on the home page
    When I click on "Barges"
    Then I'll be taken to the "barges" page

  Scenario:
    Given I'm on the home page
    When I click on "Boat Parts"
    Then I'll be taken to the "parts" page

  Scenario:
    Given I'm on the home page
    When I click on "/products/new?base_model_id=1"
    Then I'll be taken to the product page for "Dock"

  Scenario:
    Given I'm on the home page
    When I click on "/products/new?base_model_id=2"
    Then I'll be taken to the product page for "Lift"

  Scenario:
    Given I'm on the home page
    When I click on "Cart"
    Then I'll be taken to the "shopping_cart" page
