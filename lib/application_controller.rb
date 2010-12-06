module Cheese
  ## Define ControllerMethods
  module Controller
  	## this one manages the usual self.included, klass_eval stuff
    extend ActiveSupport::Concern

    included do
      before_filter :test_controller_instance_method
    end

    module InstanceMethods
      def test_controller_instance_method
        puts "###### This text is coming from an application_controller before_filter that is being declared and triggered from inside the engine. This before_filter is automatically integrated in when the engine is installed into an app. Look inside lib/application_controller.rb to find it. ######"
      end

      # This method is available inside application_controller but it is not being
      # automatically executed. Notice the before_filter line above that is automatically
      # executing the first method.
      def second_controller_instance_method
        puts "###### This method is not automatically run inside application_controller, but it is available inside application_controller. To see this example add 'before_filter :second_controller_instance_method' at the top of your app's application_controller.rb ######"
      end
    end
  end
end

::ActionController::Base.send :include, Cheese::Controller


