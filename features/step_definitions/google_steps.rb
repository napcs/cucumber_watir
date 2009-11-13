
When /^I fill in the "([^\"]*)" field with "([^\"]*)"$/ do |arg1, arg2|
 field = case arg1
         when "all these words"
           find_text_field("as_q")
         when "none of these words"
           find_text_field("as_eq") 
         end
         
  field.set(arg2)  
  
end


When /^I select "([^\"]*)" from the "([^\"]*)" dropdown$/ do |arg1, arg2|
  field = case arg2
        when "Number of results"
           find_select_list("num")
        end

  field.select(arg1)
end

Given /^I click the Date, usage rights, numeric range, and more section$/ do
  element =  @browser.span(:text, "Date, usage rights, numeric range, and more")
  element.click
end


Given /^I turn on Safe Search$/ do
  find_radio("On").click
end