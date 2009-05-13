Feature: Sharing files
  In order to share a pdf with a friend
  As a caring individual
  I want to upload a file so my friend can grab it later.
  
  
  Scenario: Uploading a file to drop.io
    Given I go to "http://drop.io/"
      And I click "Additional settings (password, permissions, expiration)"
      And I fill in "guestPasswordHolder" with "1234"
      And I select "1 Day" from "bucket_expiration_interval"
      And I select "from now" from "bucket[expiration_style]"
      And I uncheck "Add Files"
      And I uncheck "Comment"
      And I uncheck "Delete"
      # doesn't seem to work on firefox yet
      When I press "commit" and wait 10 seconds
      Then I should see "This drop is empty"