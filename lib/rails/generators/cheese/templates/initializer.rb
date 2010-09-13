module Cheese
  class Engine < Rails::Engine

    config.mount_at = '/cheese'
    config.widget_factory_name = 'Factory Name'
        
  end
end
