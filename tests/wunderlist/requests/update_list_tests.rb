Shindo.tests('Fog::Tasks[:wunderlist] | update_list request') do
  
  service = Fog::Tasks[:wunderlist]

  tests('success') do
      
    tests('#update_list').succeeds do
      @list = service.lists.create :title => 'test list'
      service.update_list @list.id, { :title => 'test list modified' }
      service.lists.get(@list.id).title == 'test list modified'
    end

    @list.destroy

  end

end
