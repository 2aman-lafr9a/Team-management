# Generated by the protocol buffer compiler.  DO NOT EDIT!
# Source: team.proto for package 'team'

require 'grpc'
require 'team_pb'

module Team
  module Team
    class Service

      include ::GRPC::GenericService

      self.marshal_class_method = :encode
      self.unmarshal_class_method = :decode
      self.service_name = 'team.Team'

      rpc :CreateTeam, ::Team::CreateTeamRequest, ::Team::CreateTeamResponse
      rpc :GetTeam, ::Team::GetTeamRequest, ::Team::GetTeamResponse
      rpc :UpdateTeam, ::Team::UpdateTeamRequest, ::Team::UpdateTeamResponse
      rpc :DeleteTeam, ::Team::DeleteTeamRequest, ::Team::DeleteTeamResponse
      rpc :GetTeams, ::Team::GetTeamsRequest, ::Team::GetTeamsResponse
    end

    Stub = Service.rpc_stub_class
  end
end
