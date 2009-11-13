# Twitter's sign in button on the home page
# is a span wrapped with an anchor.
# <a href=".."><span>Sign in</span></a>
When /^I click the Sign In button$/ do
  link = @browser.span(:text, "Sign in")
  link.click
end