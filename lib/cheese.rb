module Cheese
  require 'engine' if defined?(Rails) && Rails::VERSION::MAJOR == 3
  require 'acts_as_widget/base'
  require 'application_controller'
end
