require 'spec/expectations'
require "watir-webdriver"

if ENV['BROWSER'] == 'firefox'

  browser = Watir::Browser.new(:firefox)
  
else
  case RUBY_PLATFORM
  when /darwin/
   
    if ENV['BROWSER'] == 'safari'
      #Safariwatir is basically crap and not usable right now.
      browser = Watir::Safari.new
    elsif ENV['BROWSER'] == 'chrome'
      browser = Watir::Browser.new(:chrome)
      
    else
      browser = Watir::Browser.new(:firefox)
    end

  when /win32|mingw/
    browser = Watir::Browser.new(:ie)
    
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
 # unless ENV["STAY_OPEN"]
 #    browser.close
 #  end
end
 