When /^I fill in the field with the name "(.*)" with "(.*)"$/ do |name, value|
   @browser.text_field(:name, name).set(value)
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