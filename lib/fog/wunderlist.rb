require 'fog/core'
require 'fog/tasks'

module Fog
  module Wunderlist 
    extend Fog::Provider
    service(:tasks, 'wunderlist/tasks', 'Tasks')
  end
end

