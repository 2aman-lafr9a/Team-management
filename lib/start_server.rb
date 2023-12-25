# frozen_string_literal: true
#!/usr/bin/env ruby
require "grpc"
require_relative "TeamManagement_services_pb"
require_relative "PlayerManagement_services_pb"
require "rubygems"
require_relative "services/TeamManagementService"
require_relative "services/PlayerManagementService"

class TeamManagementServer
  class << self
    def start
      @server = GRPC::RpcServer.new
      @server.add_http2_port("localhost:50051", :this_port_is_insecure)
      @server.handle(TeamManagementService)
      @server.handle(PlayerManagementService)
      @server.run_till_terminated
    end
  end
end

TeamManagementServer.start
