module Fog
  module Tasks 
    class Wunderlist 
      class Real

        def get_task(id)
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => "/me/#{id}"
          )
        end

      end

      class Mock

        def get_tasks(id)
          Fog::Mock.not_implemented
        end

      end
    end
  end
end
