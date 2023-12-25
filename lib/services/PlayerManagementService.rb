# frozen_string_literal: true

class PlayerManagementService < PlayerManagement::PlayerManagementService::Service
  def create_player(create_player_request, _unused_call)
    player_name = create_player_request.name
    player_description = create_player_request.description
    player = Player.create(name: player_name, description: player_description)
    player = player_to_proto(player)
    PlayerManagement::CreatePlayerResponse.new(id: player.id)
  end

  def get_player(get_player_request, _unused_call)
    player = Player.find(get_player_request.id)
    if player.nil?
      return PlayerManagement::GetPlayerResponse.new(id: "Player not found")
    end
    player = player_to_proto(player)
    PlayerManagement::GetPlayerResponse.new(id: player.id, name: player.name, description: player.description)
  end

  def update_player(update_player_request, _unused_call)
    player = Player.find(update_player_request.id)
    if player.nil?
      return PlayerManagement::UpdatePlayerResponse.new(id: "Player not found")
    end
    player.update(name: update_player_request.name, description: update_player_request.description)
    PlayerManagement::UpdatePlayerResponse.new(id: player.id.to_s)
  end

  def delete_player(delete_player_request, _unused_call)
    player = Player.find(delete_player_request.id)
    if player.nil?
      return PlayerManagement::DeletePlayerResponse.new(id: "Player not found")
    end
    player.destroy
    PlayerManagement::DeletePlayerResponse.new(id: player.id.to_s)
  end

  def get_players(get_players_request, _unused_call)
    team = Team.find(get_players_request.team_id)
    if team.nil?
      return PlayerManagement::GetPlayersResponse.new(players: [])
    end
    players = team.players
    if players.nil?
      return PlayerManagement::GetPlayersResponse.new(players: [])
    end
    PlayerManagement::GetPlayersResponse.new(players: players.map { |player| player_to_proto(player) })
  end

  private

  def player_to_proto(player)
    PlayerManagement::Player.new(id: player.id.to_s, name: player.name, description: player.description)
  end
end
