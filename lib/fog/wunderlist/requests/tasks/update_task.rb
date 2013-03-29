module Fog
  module Tasks 
    class Wunderlist 
      class Real

        def update_task(id, attributes = {})
          request(
            :expects  => [200],
            :method   => 'PUT',
            :path     => "#{id}",
            :body     => attributes 
          )
        end

      end

      class Mock

        def update_task(id, attributes = {})
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
