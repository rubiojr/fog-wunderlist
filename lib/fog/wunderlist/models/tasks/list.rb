require 'fog/core/model'

module Fog
  module Tasks
    class Wunderlist 
      class List < Fog::Model
        
        identity  :id

        attribute :title
        attribute :created_at,       :type => :time
        attribute :updated_at,       :type => :time
        attribute :version
        attribute :local_identifier
        attribute :position
        attribute :type
        attribute :owner_id
        
        def destroy
          requires :id
          service.delete_list(id)
          true
        end

        def save
          requires :title
          if identity
            update
          else
            merge_attributes(
              service.create_list(title, attributes).body
            )
          end
          true
        end

        def update
          requires :id
          merge_attributes(
            service.update_list(id, attributes).body
          )
        end

      end
    end
  end
end
