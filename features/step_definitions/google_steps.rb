
When /^I fill in the "([^\"]*)" field with "([^\"]*)"$/ do |field, value|
  field = case field
          when "all these words"
            find_text_field("as_q")
          when "any of these unwanted words"
            find_text_field("as_eq")
          end
        
  field.value = value
end

Given /^I select "([^\"]*)" from the "([^\"]*)" dropdown$/ do |value, name|
  field = find_select_list("num")
  field.select(value)
end

Given /^I click the Date, usage rights, numeric range, and more section$/ do
  @browser.span(:text, "Date, usage rights, numeric range, and more").click
end

Given /^I turn on Safe Search$/ do
  find_radio("On").click
end