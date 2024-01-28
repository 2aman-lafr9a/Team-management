# frozen_string_literal: true

require 'grpc'
require_relative '../models/player_model'
require_relative '../player_services_pb'
require_relative '../utils/dbMigration'
require_relative '../offer_services_pb'
require 'kafka'

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
    offer = player.offer
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
      weight: weight,
      offer: offer
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
    @player = PlayerModel.find_by(name: get_player_request.id)
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
                  weight: update_player_request.player.weight.to_i,
                  offer: update_player_request.player.offer)
    Player::UpdatePlayerResponse.new(player: player_to_proto(player))
  end

  def delete_player(delete_player_request, _unused_call)
    player = PlayerModel.find(delete_player_request.id)
    return Player::DeletePlayerResponse.new(id: 'Player not found') if player.nil?

    player.destroy
    Player::DeletePlayerResponse.new(id: player.id.to_s)
  end

  def get_players(get_players_request, _unused_call)
    @players = if get_players_request.team_id != ''
                 PlayerModel.where(team_id: get_players_request.team_id)
               else
                 PlayerModel.all
               end
    limit = get_players_request.limit
    page = get_players_request.page
    @players = @players.limit(limit) if limit.positive?
    @players = @players.offset(page * limit) if page.positive?
    Player::GetPlayersResponse.new(players: @players.map { |player| player_to_proto(player) })
  end

  def get_offers_by_player(get_offers_by_player_request, _unused_call)
    stub = Offer::Offer::Stub.new('localhost:50002', :this_channel_is_insecure)
    @offer = stub.get_offer(Offer::GetOfferIdRequest.new(id: get_offers_by_player_request.player_id))
    Offer::GetOffersByPlayerResponse.new(offer: @offer)
  end

  def get_recommended_offer(get_recommended_offer_request, _unused_call)
    config = Kafka::Config.new("bootstrap.servers": 'localhost:9092')
    producer = Kafka::Producer.new(config)

    @player = PlayerModel.find(get_recommended_offer_request.id)

    event = Kafka::Event.new(
      topic: 'user_interaction',
      payload: {
        id: @player.id,
        name: @player.name,
        age: @player.age,
        overall: @player.overall,
        value: @player.value
      }
    )

    result = producer.produce(event, event.to_json)

    consumer = Kafka::Consumer.new(config)
    consumer.subscribe('recommendations_topic')

    @run = true
    trap('INT') { @run = false }
    trap('TERM') { @run = false }

    while @run
      consumer.poll do |message|
        Offer::OfferItem.new(id: message.payload['id'],
                             name: message.payload['name'],
                             agency: message.payload['agency'],
                             description: message.payload['description'],
                             price: message.payload['price'],
                             date: message.payload['date'],
                             rating: message.payload['rating'],
                             type: message.payload['type'])
      end
    end


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
                           weight: player.weight.to_i,
                           offer: player.offer)
  end
end
