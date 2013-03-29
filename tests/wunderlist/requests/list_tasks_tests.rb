Shindo.tests('Fog::Tasks[:wunderlist] | list_tasks request', ['wunderlist']) do
  
  @task_format = {
    'id'                  => String,
    'created_at'          => String,
    'updated_at'          => String,
    'title'               => String,
    'starred'             => Fog::Boolean,
    'note'                => Fog::Nullable::String,
    'completed_at'        => Fog::Nullable::String,
    'local_identifier'    => Fog::Nullable::String,
    'recurrence_type'     => Fog::Nullable::String,
    'recurrence_count'    => Integer,
    'recurring_parent_id' => Fog::Nullable::String,
    'due_date'            => Fog::Nullable::String,
    'parent_id'           => Fog::Nullable::String,
    'created_by_id'       => Fog::Nullable::String,
    'updated_by_id'       => Fog::Nullable::String,
    'completed_by_id'     => Fog::Nullable::String,
    'version'             => Integer,
    'assignee_id'         => Fog::Nullable::String,
    'type'                => String,
    'user_id'             => String,
    'owner_id'            => String,
    'position'            => Fog::Nullable::Float,
    'list_id'             => String,
    'deleted_at'          => Fog::Nullable::String
  }

  service = Fog::Tasks[:wunderlist]
  tests('success') do
    @task = service.create_task("fog test task", 'inbox').body
    service.list_tasks.body.each do |t| 
      tests('#list_tasks').formats(@task_format) do
        t
      end
    end
      
    service.delete_task @task['id']

  end

end
