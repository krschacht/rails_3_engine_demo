module Cheese
  require 'engine' if defined?(Rails) && Rails::VERSION::MAJOR == 3
  require 'acts_as_widget/base'
end
