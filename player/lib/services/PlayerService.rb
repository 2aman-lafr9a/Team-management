# frozen_string_literal: true

require 'grpc'
require_relative '../models/player'
require_relative '../player_services_pb'

class PlayerService < Player::Player::Service
  def create_player(create_player_request, _unused_call)
    player = create_player_request.player
    name = player.name
    age = player.age
    photo = player.photo
    nationality = player.nationality
    flag = player.flag
    overall = player.overall
    potential = player.potential
    position = player.position
    value = player.value
    wage = player.wage
    preferred_foot = player.preferred_foot
    international_reputation = player.international_reputation
    weak_foot = player.weak_foot
    skill_moves = player.skill_moves
    work_rate = player.work_rate
    body_type = player.body_type
    height = player.height
    weight = player.weight
    @player = PlayerModel.new(
      name: name,
      age: age,
      photo: photo,
      nationality: nationality,
      flag: flag,
      overall: overall,
      potential: potential,
      position: position,
      value: value,
      wage: wage,
      preferred_foot: preferred_foot,
      international_reputation: international_reputation,
      weak_foot: weak_foot,
      skill_moves: skill_moves,
      work_rate: work_rate,
      body_type: body_type,
      height: height,
      weight: weight
    )
    if @player.save!
      Player::CreatePlayerResponse.new(id: @player.id.to_s)
    else
      Player::CreatePlayerResponse.new(id: "Player not created")
    end
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
    players = PlayerModel.find_by(team_id: get_players_request.team_id)
    Player::GetPlayersResponse.new(players: players)
  end

  private

  def player_to_proto(player)
    Player::Player.new(id: player.id.to_s, name: player.name, description: player.description)
  end
end
