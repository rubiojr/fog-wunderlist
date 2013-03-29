Shindo.tests('Fog::Tasks[:wunderlist] | create_task request', ['wunderlist']) do
  
  service = Fog::Tasks[:wunderlist]

  tests('success') do

    test('#update_task title') do
      @task = service.create_task("fog test task", 'inbox').body
      service.update_task @task['id'], { :title => 'updated by fog' }
      @task = service.tasks.get @task['id']
      @task.title == 'updated by fog'
    end
    
    test('#update_task note') do
      service.update_task @task.id, { :note => 'some notes' }
      @task = service.tasks.get @task.id
      @task.note == 'some notes'
    end

    @task.destroy
  end

end
