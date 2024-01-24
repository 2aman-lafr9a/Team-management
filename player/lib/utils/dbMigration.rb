# frozen_string_literal: true

require 'active_record'
require 'csv'

ActiveRecord::Base.establish_connection(
  adapter: 'mysql2',
  host: ENV['DB_HOST'] || 'localhost',
  username: ENV['DB_USERNAME'] || 'root',
  password: ENV['DB_PASSWORD'] || 'password',
  database: ENV['team_management'] || 'TeamManagement'
)

class Create < ActiveRecord::Migration[6.0]
  def change
    create_table :player_model do |t|
      t.string :name
      t.integer :age
      t.string :photo
      t.string :nationality
      t.string :flag
      t.integer :overall
      t.integer :potential
      t.string :position
      t.integer :value
      t.integer :wage
      t.string :preferred_foot
      t.integer :international_reputation
      t.integer :weak_foot
      t.integer :skill_moves
      t.string :work_rate
      t.string :body_type
      t.string :height
      t.string :weight
    end
  end
end

class AddTeamIdToPlayer < ActiveRecord::Migration[6.0]
  def change
    add_column :player_model, :team_id, :integer
  end
end

class FillDatabase < ActiveRecord::Migration[6.0]
  def up
    CSV.foreach(File.join(File.dirname(__FILE__),'FIFA23_official_data.csv'), headers: true) do |row|
      player = PlayerModel.create(
        name: row['Name'],
        age: row['Age'],
        nationality: row['Nationality'],
        overall: row['Overall'],
        potential: row['Potential'],
        preferred_foot: row['Preferred Foot'],
        international_reputation: row['International Reputation'],
        weak_foot: row['Weak Foot'],
        skill_moves: row['Skill Moves'],
        body_type: row['Body Type'],
        height: row['Height'],
        weight: row['Weight'],
        photo: row['Photo'],
        flag: row['Flag'],
        position: row['Position'],
        value: row['Value'],
        wage: row['Wage'],
        work_rate: row['Work Rate']
      )
      if player.save
        puts "Player #{player.name} saved"
      else
        puts "Player #{player.name} not saved. Error: #{player.errors.full_messages}"
      end
    end
  end
  def down
    PlayerModel.delete_all
  end
end