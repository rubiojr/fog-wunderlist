# Wunderlist Fog provider

Fog provider to manage www.wunderlist.com tasks using the familiar
[Fog](http://fog.io) interface.

The Wunderlist Fog provider was created to prove myself that creating 
an isolated Fog provider without modifying Fog itself is possible nowadays.

The provider is fully functional an only depends on Fog. Note that
Wunderlist does not provide a public API so the API might change at
any time breaking this library.

fog-wunderlist is based on the excellent work from 
https://github.com/bsmt/wunderpy and some API request sniffing
done by myself.

## Installation

    gem install fog-wunderlist

## Connecting to Wunderlist

```ruby

require 'fog/wunderlist'
require 'pp'

service = Fog::Tasks.new :provider => 'Wunderlist',
                         :wunderlist_username => 'myemail@foo.com',
                         :wunderlist_password => 'secret'

```

## Managing tasks

```ruby

# Listing tasks
service.tasks.each do |task|
  pp task # => 
  # <Fog::Tasks::Wunderlist::Task
  #   id="ACQSAACGzsM",
  #   recurrence_count=0,
  #   assignee_id=nil,
  #   user_id="AAQSAAAHQGM",
  #   title="Tap to open me",
  #   recurring_parent_id=nil,
  #   note="",
  #   parent_id=nil,
  #   version=5,
  #   list_id="inbox",
  #   type="Task",
  #   owner_id="AAQSAAAHQGM",
  #   created_by_id=nil,
  #   due_date=nil,
  #   created_at=2012-12-06 14:32:31 UTC,
  #   completed_at=2012-12-06 14:32:31 UTC,
  #   updated_at=2012-12-06 14:32:31 UTC,
  #   local_identifier=nil,
  #   position=0.0,
  #   starred=true
  # >
end

# Creating a new Task in my 'Home' list
list = service.lists.find { |l| l.title == 'Home' }
service.tasks.create :title => 'test task',
                     :starred => true,
                     :list_id => list.id

# There's a special list named 'inbox' also
# that is not listed but we can use
service.tasks.create :title => 'test task',
                     :starred => true,
                     :list_id => 'inbox'

# Updating a task
task = service.tasks.find { |t| t.title == 'my task' } 
task.note = 'some random notes'
task.starred = true
task.save

# Deleting the task
task.destroy
```

## Managing lists

```ruby
# List all the lists (inbox isn't listed)
service.lists.each do |list|
  pp list # =>
  #<Fog::Tasks::Wunderlist::List
  #  id="ABQSAABVlOE",
  #  title="Home",
  #  created_at=2012-12-06 00:09:15 UTC,
  #  updated_at=2013-03-28 20:53:14 UTC,
  #  version=2,
  #  local_identifier=nil,
  #  position=18.0,
  #  type="List",
  #  owner_id="AAQSAAAHQGM"
  #>
end

# Creating a new list
list = service.lists.create :title => 'new list'

# Updating the list
list.title = 'new title for the list'
list.save

# Destroy the list
list.destroy

```
