Feature: Share code with others
  In order to help a friend
  As a mentor
  I want to share some code I wrote with my friend.
  
  
  Scenario: Create a private paste
    Given I go to "http://www.pastie.org/"
     When I fill in "paste[body]" with "This is a simple test case using Cucumber"
      And I select "Plain text" from "Language:"
      And I check "paste[restricted]"
       And I press "Paste"
      Then I should see "less than a minute ago"  
   