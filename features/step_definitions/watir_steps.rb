
### [urls] When I visit "http://www.twitter.com/"
When /^I visit "(.*)"$/ do |url| 
  @browser.goto(url)
end

### [urls] When I go to "http://www.twitter.com/"
When /^I go to "(.*)"$/ do |url| 
  @browser.goto(url)
end

### [links] When I click "Apply Now"
When /^I click "(.*)"$/ do |text|
  link = @browser.link(:text, text)
  link.click
end


### [links] When I click "Apply Now"
When /^I click "(.*)" and comfirm the popup$/ do |text|
  link = @browser.link(:text, text)
  startClicker("OK" , 3)
  link.click_no_wait
  
end
 
### [links] Then I should see a link to "Our blog" with the url "http://www.foo.bar.com/"
Then /^I should see a link to "(.*)" with the url "(.*)"$/ do |text, url|
  link = @browser.link(:url, url)
  link.should_not == nil
  link.text.should == text
end

### [links] Then I should see a link that contains the text "Our blog" and the url "http://www.foo.bar.com/"
Then /^I should see a link that contains the text "(.*)" and the url (.*)$/ do |text, url|
  link = @browser.link(:url, url)
  link.should_not == nil
  link.text.should include text
end

### [links] Then I should see a link to "Sign up!"
Then /^I should see a link to "(.*)"$/ do |text|
  link = @browser.link(:text, text)
  link.should_not == nil
end

### [links] Then I should see a link with the url "http://www.foo.bar.com/"
Then /I should see a link with the url (.*)$/ do |url|
  link = @browser.link(:url, url)
  link.should_not == nil
end

### [general] Given I see "Record added successfully"
Given /I see "(.*)"/ do |text|
  @browser.text.should include(text)
end

### [general] Then I should see "Record added successfully"
Then /I should see "(.*)"/ do |text|
  @browser.text.should include(text)
end

### [general] Then I should not see "You don't have access to that feature"
Then /I should not see "(.*)"/ do |text|
  @browser.text.should_not include(text)
end

# Find image by alt and click it
### [image] When I click the "Apply now" image  (uses ALT text)
Then /I click the "(.*)" image$/ do |alt|
  our_image = @browser.image(:alt , alt).click
end

## Forms

# text fields (input, password, and textarea)
### [text fields] When I fill in "Username" with "Foo"
When /^I fill in "([^\"]*)" with "([^\"]*)"$/ do |field, value|

  field = find_text_field(field)
  field.set(value)
end

### [select box] When I select "English" from "Languages"
When /^I select "([^\"]*)" from "([^\"]*)"$/ do |value, field|
  field = find_select_list(field)
  field.select(value)
end

### [check box] When I check "Remember me"
When /^I check "([^\"]*)"$/ do |field|
  field = find_checkbox(field)
  field.set
end

### [check box] When I uncheck "Remember me"
When /^I uncheck "([^\"]*)"$/ do |field|
  field = find_checkbox(field)
  field.clear
end

### [check box] Then the "Remember me" checkbox should be checked
Then /^the "([^\"]*)" checkbox should be checked$/ do |field|
  field = find_checkbox(field)
  field.should be_checked
end

### [check box] Then the "Remember me" checkbox should not be checked
Then /^the "([^\"]*)" checkbox should not be checked$/ do |field|
  field = find_checkbox(field)
  field.should_not be_checked
end

### [radio button] When I choose "Remember me"
When /^I choose "([^\"]*)"$/ do |field|
  field = find_radio(field)
  field.set
end

### [radio button] Then the "Remember me" option should be chosen
Then /^the "([^\"]*)" option should be chosen$/ do |field|
  field = find_radio(field)
  field.should be_checked
end

### [radio button] Then the "Remember me" option should not be chosen
Then /^the "([^\"]*)" option should not be chosen$/ do |field|
  field = find_radio(field)
  field.should_not be_checked
end


# Buttons get pressed, links get clicked
### [buttons] When I press "Submit" 
When /^I press "([^\"]*)"$/ do |button|
  form_button = find_button(button)
  form_button.click
end

### [buttons] When I press "Submit" and wait for a new page
When /^I press "([^\"]*)" and wait for a new page$/ do |button|
  start_url = @browser.url
  form_button = find_button(button)
  form_button.click
  Watir::Waiter::wait_until { @browser.url != start_url }
end


### [buttons] When I press "Submit" and wait 5 seconds
When /^I press "([^\"]*)" and wait ([^\"]*) seconds$/ do |button, number_of_seconds|
  form_button = find_button(button)
  form_button.click
  sleep number_of_seconds.to_i
end

### [Waiting] When I wait 10 seconds
 Given /I wait (\d+) seconds*/ do |number_of_seconds|
  sleep number_of_seconds.to_i
end

### [DIVs] Then I should see a div with the id "navbar"
Given /I should see a div with the id "([^\"]*)"$/ do |id|
  @browser.div(:id, id).exists?
end

### [DIVs] And I wait until I see a div with the id "dialog"
Given /^I wait until I see a div with the id "([^\"]*)"$/ do |id|
  7.times do |i|
    break if @browser.div(:id, id).exists?
    i == 7 ? raise(Watir::Exception::UnknownObjectException) : sleep(1)
  end
end

### [Forms] Then I should see a form that goes to "http://www.foo.bar.com/signup"
Then /^I should see a form that goes to "(.*)"$/ do |action|
  @browser.form(:action, action)
end

### [browser] I should be at "http://www.foo.com/"
Then /^I should should be at "(.*)"$/ do |browser_url|
  @browser.url.should == browser_url
end

### [browser] The browser's URL should be "http://www.foo.com/"
Then /^The browser's URL should be "(.*)"$/ do |browser_url|
  @browser.url.should == browser_url
end

### [browser] The browser's URL should not be "http://www.foo.com/"
Then /^The browser's URL should not be "(.*)"$/ do |browser_url|
  @browser.url.should_not == browser_url
end

### [browser] The browser's URL should contain "https:"
Then /^The browser's URL should contain "(.*)"$/ do |string|
  @browser.url.should include(string)
end

### [browser] The browser's URL should not contain "https:"
Then /^The browser's URL should not contain "(.*)"$/ do |string|
  @browser.url.should_not include(string)
end

### [files] When I attach the file at "c:/foo/bar.exe" to "Your mugshot"
When /^I attach the file at "([^\"]*)" to "([^\"]*)"$/ do |path, field|
  field = find_file_field(field)
  field.set(path)
end

### [JS] When I move the mouse over the div containing "more information"
Then /^I move the mouse over the div containing "([^\"]*)"$/ do |div_text|
  divs = browser.divs
  divs.each do |d|
    if d.text.downcase.match(/#{div_text}/i)
      d.fire_event('onmouseover')
    end
  end
end

### [General] I should see an element with id of "cs_env_status"
Then /^I see an element with an id of "(.*)"$/ do |id|
  @browser.element_by_xpath("id('#{id}')").exists?  
end 

### [General] I should NOT see an element with id of "cs_env_status"
Then /^the element with id of "(.*)" should not exist$/ do |id|
  body_element = @browser.element_by_xpath("id('#{id}')")
  body_element.exists?.should ==false 
end

###[General] The element with id of "cs_PageModeContainer" contains "Read" 
Then /^the element with id of "(.*)" contains "(.*)"$/ do |id, string|
  body_element = @browser.element_by_xpath("id('#{id}')")
  body_element.exists?  
  body_element.text.should ==string
end

###[General] The element with id of "cs_PageModeContainer" and NOT contains "Read" 
Then /^the element with id of "(.*)" should not contain "(.*)"$/ do |id, string|
  body_element = @browser.element_by_xpath("id('#{id}')")
  body_element.exists?  
  body_element.text.should_not ==string
end

### [browser] The browser's title should contain "foo"
Then /^the browser's title should contain "([^\"]*)"$/ do |string|
  @browser.title.should include(string)
end

### [browser] The browser's title should not contain "foo"
Then /^the browser's title should not contain "([^\"]*)"$/ do |string|
  @browser.title.should_not include(string)
end

