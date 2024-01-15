# frozen_string_literal: true

require "grpc"
require_relative "../models/team"

class TeamManagementService < TeamManagement::TeamManagement::Service
  def create_team(create_team_request, _unused_call)
    team_name = create_team_request.name
    team_description = create_team_request.description
    team_owner = create_team_request.owner
    team_logo = create_team_request.team_logo
    players_id = create_team_request.players_id
    team = Team.create(name: team_name, description: team_description, owner: team_owner, team_logo: team_logo, 
                       players_id: players_id)
    team = team_to_proto(team)
    TeamManagement::CreateTeamResponse.new(id: team.id)
  end

  def get_team(get_team_request, _unused_call)
    team = Team.find(get_team_request.id)
    if team.nil?
      return TeamManagement::GetTeamResponse.new(id: "Team not found")
    end
    team = team_to_proto(team)
    TeamManagement::GetTeamResponse.new(id: team.id, name: team.name, description: team.description, owner: team.owner)
  end

  def update_team(update_team_request, _unused_call)
    team = Team.find(update_team_request.id)
    if team.nil?
      return TeamManagement::UpdateTeamResponse.new(id: "Team not found")
    end
    team.update(name: update_team_request.name, description: update_team_request.description, 
                owner: update_team_request.owner)
    TeamManagement::UpdateTeamResponse.new(id: team.id.to_s)
  end

  def delete_team(delete_team_request, _unused_call)
    team = Team.find(delete_team_request.id)
    if team.nil?
      return TeamManagement::DeleteTeamResponse.new(id: "Team not found")
    end
    team.destroy
    TeamManagement::DeleteTeamResponse.new(id: team.id.to_s)
  end

  def get_teams(_unused_request, _unused_call)
    teams = Team.all
    if teams.nil?
      return TeamManagement::GetTeamsResponse.new(teams: [])
    end
    TeamManagement::GetTeamsResponse.new(teams: teams.map { |team| team_to_proto(team) })
  end

  private

  def team_to_proto(team)
    TeamManagement::Team.new(id: team.id.to_s, name: team.name, description: team.description, owner: team.owner)
  end
end
