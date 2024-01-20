# frozen_string_literal: true
#!/usr/bin/env ruby
require 'grpc'
require_relative 'utils/dbMigration'
require_relative 'teamManager_services_pb'
require_relative 'services/TeamManagerService'

class TeamManagerServer
  class << self
    def start
      Create.migrate(:up) unless ActiveRecord::Base.connection.table_exists?(:teamManager_model)
      AddTeamIdToTeamManager.migrate(:up) unless ActiveRecord::Base.connection.column_exists?(:teamManager_model, :team_id)
      @server = GRPC::RpcServer.new
      @server.add_http2_port('localhost:50007', :this_port_is_insecure)
      @server.handle(TeamManagerService)
      @server.run_till_terminated
    end
  end
end

TeamManagerServer.start
