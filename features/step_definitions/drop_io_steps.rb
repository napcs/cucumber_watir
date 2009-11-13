# Drop.io uses a funny submit button. It uses JS
# and this causes FireWatir to not notice that the page has changed.
# additionally, we have to sleep for a bit to make the page work.
# This is very brittle, but is common when testing other people's sites.
# Moral of the story is to write *good* code that you can easily test.
When /^I press the Create A Drop button$/ do
  form_button = find_button("commit")
  form_button.click
  sleep 2
  @browser.refresh  
end