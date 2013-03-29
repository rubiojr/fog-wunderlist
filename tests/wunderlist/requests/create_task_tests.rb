Shindo.tests('Fog::Tasks[:wunderlist] | create_task request', ['wunderlist']) do
  
  tests('success') do

    test('#create_task') do
      @task = Fog::Tasks[:wunderlist].create_task("fog test task", 'inbox').body
      @task['title'] == 'fog test task'
    end

    test('task list is inbox') do
      @task['list_id'] == 'inbox'
    end
    
    test('#delete_task') do
      Fog::Tasks[:wunderlist].delete_task(@task['id']).status == 200
    end
  end

  tests('failure') do
    raises(Excon::Errors::NotFound, '#create_task with invalid list') do
      Fog::Tasks[:wunderlist].create_task("fog test task", '00000011').body
    end
  end

end
