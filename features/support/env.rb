require 'spec/expectations'
require 'watir'

if ENV['BROWSER'] == 'firefox'
  Watir::Browser.default = 'firefox'
  browser = Watir::Browser.new
  
else
  case RUBY_PLATFORM
  when /darwin/
   
    if ENV['BROWSER'] == 'safari'
      #Safariwatir is basically crap and not usable right now.
      browser = Watir::Safari.new
    else
      Watir::Browser.default = 'firefox' 
      browser = Watir::Browser.new
    end

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
 