# frozen_string_literal: true

require "grpc"
require_relative "../models/team_model"
require_relative "../team_services_pb"

class TeamService < Team::Team::Service
  def create_team(create_team_request, _unused_call)
    team_name = create_team_request.name
    team_description = create_team_request.description
    team_owner = create_team_request.owner
    team_logo = create_team_request.team_logo
    players_id = []
    create_team_request.players_id.each do |player_id|
      players_id.push(player_id)
    end
    @team = TeamModel.new(name: team_name, description: team_description, owner: team_owner, team_logo: team_logo,
                          players_id: players_id)
    if @team.save
      Team::CreateTeamResponse.new(id: @team.id.to_s)
    else
      Team::CreateTeamResponse.new(id: "Team not created")
    end
  end

  def get_team(get_team_request, _unused_call)
    @team = TeamModel.find(get_team_request.id)
    if @team.nil?
      return Team::GetTeamResponse.new(id: "Team not found")
    end
    Team::GetTeamResponse.new(id: @team.id.to_s, name: @team.name, description: @team.description,
                              owner: @team.owner)
  end

  def update_team(update_team_request, _unused_call)
    team = TeamModel.find(update_team_request.id)
    if team.nil?
      return Team::UpdateTeamResponse.new(id: "Team not found")
    end
    team.name = update_team_request.name
    team.description = update_team_request.description
    team.owner = update_team_request.owner
    team.save
    Team::UpdateTeamResponse.new(id: team.id.to_s)
  end

  def delete_team(delete_team_request, _unused_call)
    team = TeamModel.find(delete_team_request.id)
    if team.nil?
      return Team::DeleteTeamResponse.new(id: "Team not found")
    end
    team.destroy
    Team::DeleteTeamResponse.new(id: team.id.to_s)
  end

  def get_teams(_unused_get_teams_request, _unused_call)
    teams = TeamModel.all
    Team::GetTeamsResponse.new(teams: teams.map { |team| team_to_proto(team) })
  end

  private

  def team_to_proto(team)
    Team::TeamItem.new(id: team.id.to_s,
                        name: team.name,
                        description: team.description,
                        owner: team.owner)
  end
end
