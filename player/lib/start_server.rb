# frozen_string_literal: true
#!/usr/bin/env ruby
require 'grpc'
require_relative 'player_services_pb'
require 'rubygems'
require_relative 'services/PlayerService'

class PlayerServer
  class << self
    def start
      @server = GRPC::RpcServer.new
      @server.add_http2_port('localhost:50004', :this_port_is_insecure)
      @server.handle(PlayerService)
      @server.run_till_terminated
    end
  end
end

PlayerServer.start
