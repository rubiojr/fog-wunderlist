ENV['FOG_RC']         = ENV['FOG_RC'] || File.expand_path('../.fog', __FILE__)
ENV['FOG_CREDENTIAL'] = ENV['FOG_CREDENTIAL'] || 'default'

require 'fog/wunderlist'

Dir["./#{File.dirname(__FILE__)}/helpers/*.rb"].each do |h|
  require h
end
