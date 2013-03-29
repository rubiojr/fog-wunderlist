module Fog
  module Tasks 
    class Wunderlist 
      class Real

        def create_task(title, list_id, attributes = {})
          request(
            :expects  => [201],
            :method   => 'POST',
            :path     => "/me/tasks",
            :body     => { 
              :title => title,
              :list_id => list_id
            }.merge(attributes)
          )
        end

      end

      class Mock

        def create_task(attributes)
          Fog::Mock.not_implemented
          #response = Excon::Response.new
          #response.status = 200
          #response.body = {
          #}
          #response
        end

      end
    end
  end
end
