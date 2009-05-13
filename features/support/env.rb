require 'spec/expectations'
require 'watir'

if ENV['FIREWATIR']
  Watir::Browser.default = 'firefox'
  browser = Watir::Browser.new
  
else
  case RUBY_PLATFORM
  when /darwin/
    browser = Watir::Safari.new
  when /win32|mingw/
    Watir::Browser.default = 'ie'
    browser = Watir::Browser.new
    
  when /java/
    require 'celerity'
    Browser = Celerity::Browser
  else
    raise "This platform is not supported (#{PLATFORM})"
  end
end
 
# "before all"
 
Before do
  @browser = browser
end
 
# "after all"
at_exit do
  unless ENV["STAY_OPEN"]
    browser.close
  end
end
 