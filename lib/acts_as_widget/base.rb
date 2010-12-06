module Cheese
  module ActsAsWidget

    ## Define ModelMethods
    module Base
      def self.included(klass)
        klass.class_eval do
          extend Config
        end
      end
      
      module Config
        def acts_as_widget
        
          # This is where arbitrary code goes that you want to 
          # add to the class that declared "acts_as_widget"
          
          has_many :widgets,  :class_name => 'Cheese::Widget'

          include Cheese::ActsAsWidget::Base::InstanceMethods
        end
      end
      
      module InstanceMethods
        
        def factory_name
          "this is an example instance method"
        end
                
      end # InstanceMethods      
    end

  end
end

::ActiveRecord::Base.send :include, Cheese::ActsAsWidget::Base
