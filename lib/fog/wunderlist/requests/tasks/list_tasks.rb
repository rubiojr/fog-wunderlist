module Fog
  module Tasks 
    class Wunderlist 
      class Real

        def list_tasks
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => '/me/tasks'
          )
        end

      end

      class Mock

        def list_tasks
          Fog::Mock.not_implementeD
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
