# frozen_string_literal: true
# !/usr/bin/env ruby
require "grpc"
require_relative "team_services_pb"
require "rubygems"
require_relative "services/TeamService"
require_relative "utils/dbMigration"

class TeamServer
  class << self
    def start
      Create.migrate(:up) unless ActiveRecord::Base.connection.table_exists?(:team_model)
      AddPlayersIdToTeam.migrate(:up) unless ActiveRecord::Base.connection.column_exists?(:team_model, :players_id)
      FillDatabase.migrate(:up) unless TeamModel.any?
      @server = GRPC::RpcServer.new
      @server.add_http2_port("localhost:50003", :this_port_is_insecure)
      @server.handle(TeamService)
      @server.run_till_terminated
    end
  end
end

TeamServer.start
