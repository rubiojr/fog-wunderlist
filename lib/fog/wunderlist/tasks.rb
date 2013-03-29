require 'fog/wunderlist'
require 'fog/tasks'

module Fog
  module Tasks
    class Wunderlist < Fog::Service

      requires     :wunderlist_username
      requires     :wunderlist_password

      recognizes   :wunderlist_api_url

      model_path   'fog/wunderlist/models/tasks'
      model        :task
      collection   :tasks
      model        :list
      collection   :lists
      
      request_path 'fog/wunderlist/requests/tasks'
      request      :list_tasks
      request      :list_lists
      request      :create_task
      request      :delete_task
      request      :update_task
      request      :create_list
      request      :delete_list
      request      :update_list

      class Mock

        def self.data
          @data ||= Hash.new do |hash, key|
            hash[key] = {
              :tasks => [],
              :lists => []
            }
          end
        end

        def self.reset
          @data = nil
        end

        def initialize(options={})
          @password = options[:wunderlist_password]
        end

        def data
          self.class.data[@password]
        end

        def reset_data
          self.class.data.delete(@password)
        end

      end

      class Real

        def initialize(options={})
          @username   = options[:wunderlist_username]
          @password   = options[:wunderlist_password]
          @api_url    = options[:wunderlist_api_url] || 'https://api.wunderlist.com'
          @connection = Fog::Connection.new(@api_url)
          @auth_data  = authenticate
        end

        def reload
          @connection.reset
        end

        def request(params = {})
          params.merge!(
            :headers => { 
              'Authorization' => "Bearer #{@auth_data['token']}",
              'Content-Type'  => 'application/json; charset=utf-8'
            },
            :body => Fog::JSON.encode(params[:body])
          )
          response = @connection.request(params)

          unless response.body.empty?
            response.body = Fog::JSON.decode(response.body)
            #if response.body['status'] != 'OK'
            #  raise Fog::Errors::Error.new
            #end
          end
          response
        end
        
        private
        def authenticate
          res = @connection.request :method  => 'POST', 
                                    :path    => '/login',
                                    :expects => [200],
                                    :body    => Fog::JSON.encode({ 
                                      :email => @username, 
                                      :password => @password
                                    })
          Fog::JSON.decode(res.body)
        end


      end
    end
  end
end
