# frozen_string_literal: true

require 'grpc'
require_relative '../models/teamManager_model'
require_relative '../teamManager_services_pb'
require_relative '../utils/dbMigration'

class TeamManagerService < TeamManager::TeamManager::Service
  def create_TeamManager(create_teamManager_request, _unused_call)
    teamManager = TeamManagerModel.new
    teamManager.name = create_teamManager_request.name
    teamManager.age = create_teamManager_request.age
    teamManager.surname = create_teamManager_request.surname
    teamManager.save
    TeamManager::CreateTeamManagerResponse.new(id: teamManager.id.to_s)
  end

  def get_TeamManager(get_teamManager_request, _unused_call)
    teamManager = TeamManagerModel.find(get_teamManager_request.id)
    return TeamManager::GetTeamManagerResponse.new(id: 'TeamManager not found') if teamManager.nil?

    TeamManager::GetTeamManagerResponse.new(id: teamManager.id.to_s,
                                            name: teamManager.name,
                                            age: teamManager.age.to_s,
                                            surname: teamManager.surname)
  end

  def update_TeamManager(update_teamManager_request, _unused_call)
    teamManager = TeamManagerModel.find(update_teamManager_request.id)
    return TeamManager::UpdateTeamManagerResponse.new(id: 'TeamManager not found') if teamManager.nil?

    teamManager.name = update_teamManager_request.name
    teamManager.age = update_teamManager_request.age
    teamManager.surname = update_teamManager_request.surname
    teamManager.save
    TeamManager::UpdateTeamManagerResponse.new(id: teamManager.id.to_s)
  end

  def delete_TeamManager(delete_teamManager_request, _unused_call)
    teamManager = TeamManagerModel.find(delete_teamManager_request.id)
    return TeamManager::DeleteTeamManagerResponse.new(id: 'TeamManager not found') if teamManager.nil?

    teamManager.destroy
    TeamManager::DeleteTeamManagerResponse.new(id: 'TeamManager deleted')
  end

  def get_all_TeamManager(_unused_call)
    teamManagers = TeamManagerModel.all
    teamManagers.map { |teamManager| teamManager_to_proto(teamManager) }
  end

  private

  def teamManager_to_proto(teamManager)
    TeamManager::GetTeamManagersResponse.new(id: teamManager.id.to_s,
                                             name: teamManager.name,
                                             age: teamManager.age.to_s,
                                             surname: teamManager.surname
    )
  end
end
