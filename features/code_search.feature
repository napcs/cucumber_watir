Feature: Search for code
  In order to implement a Javascript image rollover
  As a developer
  I want to be able to search for code by description
  
  Scenario: Find a rollover solution
    Given I go to "http://www.snippetstash.com/"
      And I fill in "q" with "rollover"
     When I press "Search"
     Then I should see a link to "Simple Prototype image rollover"
