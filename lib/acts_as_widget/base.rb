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


    ## Define ControllerMethods
    module Controller
			## this one manages the usual self.included, klass_eval stuff
      extend ActiveSupport::Concern

      included do
        before_filter :test_controller_instance_method
      end

      module InstanceMethods
        def test_controller_instance_method
          puts "Calling an example application_controller instance_method"
        end
      end

    end

  end

end

::ActiveRecord::Base.send :include, Cheese::ActsAsWidget::Base

## this one includes the given module into ActionController 
::ActionController::Base.send :include, Cheese::ActsAsWidget::Controller
