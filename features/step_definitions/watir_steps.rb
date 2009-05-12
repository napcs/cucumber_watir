When /^I visit "(.*)"$/ do |url| 
  @browser.goto(url)
end

When /^I go to "(.*)"$/ do |url| 
  @browser.goto(url)
end

When /^I click "(.*)"$/ do |text|
  link = @browser.link(:text, text)
  link.click
end
 
Then /^I should see a link to "(.*)" with the url "(.*)"$/ do |text, url|
  link = @browser.link(:url, url)
  link.should_not == nil
  link.text.should == text
end

Then /^I should see a link that contains the text "(.*)" and the url (.*)$/ do |text, url|
  link = @browser.link(:url, url)
  link.should_not == nil
  link.text.should include text
end

Then /^I should see a link to "(.*)"$/ do |text|
  link = @browser.link(:text, text)
  link.should_not == nil
end

Then /I should see a link  with the url (.*)$/ do |url|
  link = @browser.link(:url, url)
  link.should_not == nil
end

Then /I should see "(.*)"/ do |text|
  @browser.text.should include(text)
end

Then /I should not see "(.*)"/ do |text|
  @browser.text.should_not include(text)
end

# Find image by alt and click it
Then /I click the "(.*)" image$/ do |alt|
  our_image = @browser.image(:alt , alt).click

end




## Forms
When /^I fill in "(.*)" with "(.*)"$/ do |id, value|

  #field = text_field_by_id(id) || text_field_by_name(id) #|| text_field_by_label(id)
  #field.set(value)
  text_field_by_name(id).set(value)

end


When /^I fill in the field with the name "(.*)" with "(.*)"$/ do |name, value|
   @browser.text_field(:name, name).set(value)
end

# Buttons get pressed, links get clicked
When /^I press "(.*)"$/ do |value|
  @browser.button(:value, value).click
end

When /^I select "(.*)" from the "(.*)" box$/ do |text, name_of_select_box|
  @browser.select_list(:name, name_of_select_box).select(text)
end


When /^I choose the radio button with the value of "(.*)"$/ do |text|
  @browser.radio(:value, text).set

end

When /^I choose the radio button with the name of "(.*)" with the value "(.*)"$/ do |name, value|
  @browser.radio(:name, name, value).set

end


Then /^I should see a form that goes to "(.*)"$/ do |action|
  @browser.form(:action, action)
end



def text_field_by_id(id)
  begin
    element = @browser.text_field(:id, id)
  rescue Watir::Exception::UnknownObjectException => e
    return nil
  end
end

def text_field_by_name(id)
  element = @browser.text_field(:name, id)
  
end

def text_field_by_label(label)
  element_id = element_id_by_label(label)
  element = @browser.text_field(:id, element_id)
end

def element_id_by_label(label)
  element_id = @browser.label(:text, label).for
end
