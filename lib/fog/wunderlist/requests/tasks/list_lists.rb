module Fog
  module Tasks 
    class Wunderlist 
      class Real

        def list_lists
          request(
            :expects  => [200],
            :method   => 'GET',
            :path     => '/me/lists'
          )
        end

      end

      class Mock

        def list_lists
          Fog::Mock.not_implemented
        end

      end
    end
  end
end
