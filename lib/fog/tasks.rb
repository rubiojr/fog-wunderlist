module Fog
  module Tasks

    def self.[](provider)
      self.new(:provider => provider)
    end

    def self.new(attributes)
      attributes = attributes.dup # prevent delete from having side effects
      provider = attributes.delete(:provider).to_s.downcase.to_sym

      if self.providers.include?(provider)
        require "fog/#{provider}/tasks"
        return Fog::Tasks.const_get(Fog.providers[provider]).new(attributes)
      end
      raise ArgumentError.new("#{provider} is not a recognized tasks provider")
    end

    def self.providers
      Fog.services[:tasks]
    end

    def self.servers
      servers = []
      for provider in self.providers
        begin
          servers.concat(self[provider].servers)
        rescue # ignore any missing credentials/etc
        end
      end
      servers
    end

  end
end
