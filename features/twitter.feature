Feature: Twitter login and signup
  In order automate twitter login and signup
  As a lazy person
  I want to be able to sign in and sign up to twitter automatically.
  
  
  Scenario: Logging in with incorrect details
    Given I go to "http://twitter.com/"
      And I see "Please sign in"
     When I fill in "username" with "bphogan"
      And I fill in "password" with "foo"
      And I check "Remember me"
      And I press "Sign In &raquo;"
     Then I should see "Wrong Username/Email and password combination."

  