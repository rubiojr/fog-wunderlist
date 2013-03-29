Shindo.tests("Fog::Tasks[:wunderlist] | list model") do

  service = Fog::Tasks[:wunderlist]

  tests('success') do

    tests('#save').succeeds do
      @list = service.lists.new :title => 'fog test list',
                                :starred => true,
                                :list_id => 'inbox'
      @list.save
    end
    
    tests('#update using save').succeeds do
      @list.title = 'updated title'
      @list.save
      service.lists.get(@list.id).title == 'updated title'
    end
    
    tests('#update').succeeds do
      @list.title = 'updated title 2'
      @list.update
      service.lists.get(@list.id).title == 'updated title 2'
    end

    tests('#destroy').succeeds do
      @list.destroy
    end
  end
end

