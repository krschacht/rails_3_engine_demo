module Cheese
  class WidgetsController < ApplicationController

    unloadable
    
    layout 'cheese'  # this allows you to have a gem-wide layout
    
    def index
    end
    
    def show
    end
    
  end
end