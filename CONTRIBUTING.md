# Contributing

The structure of the library is pretty similar to any Fog provider with the
exception that a new 'Tasks' service has been added. Same Fog rules for 
contributing apply.

## Building the gem

```
bundle install
rake build
```

## Testing fog-wunderlist

Create a tests/.fog file with your Wunderlist credentials:

```
# tests/.fog content
:default:
  :wunderlist_username: myemail@foobar.com
  :wunderlist_password: secret
```

Then run [shindo](http://github.com/shindo).
