Feature: Input measurement data

  Scenario: Inputting the first measurement for a new product
    Given there is an admin logged in
    And I visit a product page for a "t-shirt"
    And I enter valid "t-shirt" measurement data