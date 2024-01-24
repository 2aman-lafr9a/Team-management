# frozen_string_literal: true
#!/usr/bin/env ruby
require 'grpc'
require_relative 'utils/dbMigration'
require_relative 'player_services_pb'
require 'rubygems'
require_relative 'services/PlayerService'

class PlayerServer
  class << self
    def start
      Create.migrate(:up) unless ActiveRecord::Base.connection.table_exists?(:player_model)
      AddTeamIdToPlayer.migrate(:up) unless ActiveRecord::Base.connection.column_exists?(:player_model, :team_id)
      FillDatabase.migrate(:up) unless PlayerModel.any?
      @server = GRPC::RpcServer.new
      @server.add_http2_port('localhost:50005', :this_port_is_insecure)
      @server.handle(PlayerService)
      @server.run_till_terminated
    end
  end
end

PlayerServer.start
