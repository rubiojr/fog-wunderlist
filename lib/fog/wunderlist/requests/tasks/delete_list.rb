module Fog
  module Tasks 
    class Wunderlist 
      class Real

        def delete_list(id)
          request(
            :expects  => [200],
            :method   => 'DELETE',
            :path     => "/#{id}"
          )
        end

      end

      class Mock

        def delete_list(id)
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
