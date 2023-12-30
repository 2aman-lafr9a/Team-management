# frozen_string_literal: true

require_relative '../player_services_pb'

class PlayerService < Player::Player::Service
  def create_player(create_player_request, _unused_call)
    player_name = create_player_request.name
    player_description = create_player_request.description
    player = Player.create(name: player_name, description: player_description)
    player = player_to_proto(player)
    Player::CreatePlayerResponse.new(id: player.id)
  end

  def get_player(get_player_request, _unused_call)
    player = Player.find(get_player_request.id)
    if player.nil?
      return Player::GetPlayerResponse.new(id: "Player not found")
    end
    player = player_to_proto(player)
    Player::GetPlayerResponse.new(id: player.id, name: player.name, description: player.description)
  end

  def update_player(update_player_request, _unused_call)
    player = Player.find(update_player_request.id)
    if player.nil?
      return Player::UpdatePlayerResponse.new(id: "Player not found")
    end
    player.update(name: update_player_request.name, description: update_player_request.description)
    Player::UpdatePlayerResponse.new(id: player.id.to_s)
  end

  def delete_player(delete_player_request, _unused_call)
    player = Player.find(delete_player_request.id)
    if player.nil?
      return Player::DeletePlayerResponse.new(id: "Player not found")
    end
    player.destroy
    Player::DeletePlayerResponse.new(id: player.id.to_s)
  end

  def get_players(get_players_request, _unused_call)
    team = Team.find(get_players_request.team_id)
    if team.nil?
      return Player::GetPlayersResponse.new(players: [])
    end
    players = team.players
    if players.nil?
      return Player::GetPlayersResponse.new(players: [])
    end
    Player::GetPlayersResponse.new(players: players.map { |player| player_to_proto(player) })
  end

  private

  def player_to_proto(player)
    Player::Player.new(id: player.id.to_s, name: player.name, description: player.description)
  end
end
