module Cheese
  class Widget < ActiveRecord::Base
    set_table_name "cheese_widgets"

    def make
      puts "widget made"
    end
    
  end
end