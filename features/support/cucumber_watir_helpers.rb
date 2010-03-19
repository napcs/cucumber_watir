["text_field", "radio", "checkbox", "select_list", "file_field"].each do |field|
  
  eval <<-EOF
  
    def #{field}_by_id(id)
      element = @browser.#{field}(:id, id)
      element if element.exists?
    end

    def #{field}_by_name(name)
      element = @browser.#{field}(:name, name)
      element if element.exists?
    end

    def #{field}_by_label(label)
      element_id = element_id_by_label(label)
      #{field}_by_id(element_id)
    end
  
    def find_#{field}(value)
      element = #{field}_by_id(value) || #{field}_by_name(value) || #{field}_by_label(value)
    end
  
  EOF
  
end

def find_button(id)
  button = button_by_id(id) || button_by_name(id) || button_by_value(id)
end

def button_by_id(id)
  element = @browser.button(:id, id)
  element if element.exists?
end

def button_by_name(id)
  element = @browser.button(:name, id)
  element if element.exists?
end

def button_by_value(id)
  element = @browser.button(:value, id)
  element if element.exists?
end

def element_id_by_label(label)
    element_id = @browser.label(:text, label).for
end

def startClicker( button , waitTime = 3)
      w = WinClicker.new
      longName = $ie.dir.gsub("/" , "\\" )
      shortName = w.getShortFileName(longName)
      c = "start rubyw #{shortName }\\watir\\clickJSDialog.rb #{button }#{ waitTime} "
      puts "Starting #{c}"
      w.winsystem(c)
      w=nil
end



