Feature: Share code with others
  In order to help a friend
  As a mentor
  I want to share some code I wrote with my friend.
  
  
  Scenario: Create a private paste
    Given I go to "http://www.pastie.org/"
      And I fill in "paste[body]" with "This is a simple test case using Cucumber"
      And I select "Plain text" from "paste_parser_id"
      And I check "paste[restricted]"
      When I press the paste button
       Then the browser's title should contain "Private Paste"