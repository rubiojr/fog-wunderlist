require 'fog/core/collection'
require 'fog/wunderlist/models/tasks/list'

module Fog
  module Tasks 
    class Wunderlist

      class Lists < Fog::Collection
        model Fog::Tasks::Wunderlist::List

        def all
          load service.list_lists.body
        end

        def get(id)
          all.find{ |l| l.id == id}
        end

      end

    end
  end
end
