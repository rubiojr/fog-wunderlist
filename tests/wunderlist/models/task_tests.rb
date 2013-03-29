Shindo.tests("Fog::Tasks[:wunderlist] | task model") do

  service = Fog::Tasks[:wunderlist]

  tests('success') do

    tests('#save').succeeds do
      @task = service.tasks.new :title => 'fog test task',
                                :starred => true,
                                :list_id => 'inbox'
      @task.save
    end
    
    tests('#update using save').succeeds do
      @task.note = 'some note'
      @task.save
      service.tasks.get(@task.id).note == 'some note'
    end
    
    tests('#update').succeeds do
      @task.note = 'some note 2'
      @task.update
      service.tasks.get(@task.id).note == 'some note 2'
    end
    
    tests('#destroy').succeeds do
      @task.destroy
    end
  end
end

