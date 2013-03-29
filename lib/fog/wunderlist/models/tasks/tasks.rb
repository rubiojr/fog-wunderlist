require 'fog/core/collection'
require 'fog/wunderlist/models/tasks/task'

module Fog
  module Tasks 
    class Wunderlist

      class Tasks < Fog::Collection
        model Fog::Tasks::Wunderlist::Task

        def all
          load service.list_tasks.body
        end

        def get(id)
          all.find { |t| t.id == id }
        end

      end

    end
  end
end
