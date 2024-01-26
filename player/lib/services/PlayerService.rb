# frozen_string_literal: true

require 'grpc'
require_relative '../models/player_model'
require_relative '../player_services_pb'
require_relative '../utils/dbMigration'

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
    if @player.save
      player = PlayerModel.last
      Player::CreatePlayerResponse.new(player: player_to_proto(player))
    else
      Player::CreatePlayerResponse.new(id: 'Player not created')
    end
  end

  def get_player(get_player_request, _unused_call)
    @player = PlayerModel.new
    @player = PlayerModel.find(get_player_request.id)
    return Player::GetPlayerResponse.new(id: 'Player not found') if @player.nil?

    Player::GetPlayerResponse.new(player: player_to_proto(@player))
  end

  def update_player(update_player_request, _unused_call)
    player = PlayerModel.find(update_player_request.player.id)
    return Player::UpdatePlayerResponse.new(id: 'Player not found') if player.nil?

    player.update(id: update_player_request.player.id.to_s,
                name: update_player_request.player.name,
                age: update_player_request.player.age.to_s,
                photo: update_player_request.player.photo,
                nationality: update_player_request.player.nationality,
                flag: update_player_request.player.flag,
                overall: update_player_request.player.overall,
                potential: update_player_request.player.potential,
                position: update_player_request.player.position,
                value: update_player_request.player.value,
                wage: update_player_request.player.wage,
                preferred_foot: update_player_request.player.preferred_foot,
                international_reputation: update_player_request.player.international_reputation.to_s,
                weak_foot: update_player_request.player.weak_foot.to_s,
                skill_moves: update_player_request.player.skill_moves.to_s,
                work_rate: update_player_request.player.work_rate.to_s,
                body_type: update_player_request.player.body_type.to_s,
                height: update_player_request.player.height.to_i,
                weight: update_player_request.player.weight.to_i)
    Player::UpdatePlayerResponse.new(player: player_to_proto(player))
  end

  def delete_player(delete_player_request, _unused_call)
    player = PlayerModel.find(delete_player_request.id)
    return Player::DeletePlayerResponse.new(id: 'Player not found') if player.nil?

    player.destroy
    Player::DeletePlayerResponse.new(id: player.id.to_s)
  end

  def get_players(get_players_request, _unused_call)
    if get_players_request.team_id != ""
      @players = PlayerModel.where(team_id: get_players_request.team_id)
    else
      @players = PlayerModel.all
    end
    limit = get_players_request.limit
    page = get_players_request.page
    @players = @players.limit(limit) if limit.positive?
    @players = @players.offset(page * limit) if page.positive?
    Player::GetPlayersResponse.new(players: @players.map { |player| player_to_proto(player) })
  end

  private

  def player_to_proto(player)
    Player::PlayerItem.new(id: player.id.to_s,
                           name: player.name,
                           age: player.age.to_s,
                           photo: player.photo,
                           nationality: player.nationality,
                           flag: player.flag,
                           overall: player.overall,
                           potential: player.potential,
                           position: player.position,
                           value: player.value,
                           wage: player.wage,
                           preferred_foot: player.preferred_foot,
                           international_reputation: player.international_reputation.to_s,
                           weak_foot: player.weak_foot.to_s,
                           skill_moves: player.skill_moves.to_s,
                           work_rate: player.work_rate.to_s,
                           body_type: player.body_type.to_s,
                           height: player.height.to_i,
                           weight: player.weight.to_i)
  end
end
