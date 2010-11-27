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
      def self.included(klass)
        klass.class_eval do
          self.send :extend, Cheese::ActsAsWidget::Controller::ClassMethods
        end
      end

      module ClassMethods
        ## this has to be wrapped inside a method or else it'll bark on "undefined method `before_filter'"
        ## still trying to understand in which order which files need to be required to work around this
        ## (since 2 frakin' days already...)
        ## alternatively one can put the before_filter call into the real application_controller, which
        ## removes the need for a separate acts_as_... helper
        def acts_as_widget_controller
          self.send :include, Cheese::ActsAsWidget::Controller::InstanceMethods
          before_filter :test_controller_instance_method
        end
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
