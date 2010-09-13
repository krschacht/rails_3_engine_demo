Rails.application.routes.draw do |map|

  mount_at = Cheese::Engine.config.mount_at

  match mount_at => 'cheese/widgets#index'

  map.resources :widgets, :only => [ :index, :show ],
                          :controller => "cheese/widgets",
                          :path_prefix => mount_at,
                          :name_prefix => "cheese_"

end
