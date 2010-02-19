When /^I press the paste button$/ do
  @browser.button(:xpath, "//input[@type='image']").click
end