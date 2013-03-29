require 'fog/core/model'

module Fog
  module Tasks
    class Wunderlist 
      class Task < Fog::Model
        
        identity  :id

        attribute :recurrence_count,      :type => :integer
        attribute :assignee_id
        attribute :user_id
        attribute :title
        attribute :recurring_parent_id
        attribute :note
        attribute :parent_id
        attribute :version,               :type => :integer
        attribute :list_id
        attribute :type
        attribute :owner_id
        attribute :created_by_id
        attribute :due_date,              :type => :time
        attribute :created_at,            :type => :time
        attribute :completed_at,          :type => :time
        attribute :updated_at,            :type => :time
        attribute :local_identifier
        attribute :position,              :type => :float
        attribute :starred,               :type => :boolean

        def destroy
          requires :id
          service.delete_task(id)
          true
        end

        def save
          requires :list_id, :title
          if identity
            update
          else
            merge_attributes(
              service.create_task(title, list_id, attributes).body
            )
          end
          true
        end

        def update
          requires :id
          merge_attributes(
            service.update_task(id, attributes).body
          )
          true
        end

      end
    end
  end
end
