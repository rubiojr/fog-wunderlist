module Fog
  module Tasks 
    class Wunderlist 
      class Real

        def create_list(title, attributes = {})
          request(
            :expects  => [201],
            :method   => 'POST',
            :path     => "/me/lists",
            :body     => { :title => title }.merge(attributes)
          )
        end

      end

      class Mock

        def create_list(title, attributes = {})
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
