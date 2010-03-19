require 'spec/expectations'

def use_watir
  puts "***************** USING STANDARD WATIR ********************"
  require 'watir'
end

def use_webdriver
  puts "***************** USING WEBDRIVER ********************"
  require "watir-webdriver"
end

  case RUBY_PLATFORM
  when /darwin/
    use_webdriver
    if ENV['BROWSER'] == 'safari'
      #Safariwatir is basically crap and not usable right now.
      browser = Watir::Safari.new
    elsif ENV['BROWSER'] == 'chrome'
      browser = Watir::Browser.new(:chrome)
      
    else
      browser = Watir::Browser.new(:firefox)
    end

  when /win32|mingw/
    
    if ENV['BROWSER'] == 'chrome'
      use_webdriver
      browser = Watir::Browser.new(:chrome)
      
    elsif ENV["BROWSER"] == "firefox"
      use_webdriver      
      browser = Watir::Browser.new(:firefox)
    else
      use_watir
      Watir::Browser.default = 'ie'
      browser = Watir::Browser.new
    end
    
  when /java/
    require 'celerity'
    Browser = Celerity::Browser
  else
    raise "This platform is not supported (#{PLATFORM})"
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
 