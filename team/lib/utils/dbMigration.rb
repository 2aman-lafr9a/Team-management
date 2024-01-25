# frozen_string_literal: true

require "active_record"
require "csv"

ActiveRecord::Base.establish_connection(
  adapter: "mysql2",
  host: ENV["DB_HOST"] || "localhost",
  username: ENV["DB_USERNAME"] || "root",
  password: ENV["DB_PASSWORD"] || "password",
  database: ENV['DB_NAME'] || 'team_management'
)

class Create < ActiveRecord::Migration[6.0]
  def change
    create_table :team_model do |t|
      t.string :name
      t.string :description
      t.string :owner
      t.string :team_logo

      t.timestamps
    end
  end
end

class AddPlayersIdToTeam < ActiveRecord::Migration[6.0]
  def change
    add_column :team_model, :players_id, :integer
  end
end

class FillDatabase < ActiveRecord::Migration[6.0]
  def up
    CSV.foreach(File.join(File.dirname(__FILE__), "FIFA23_official_data.csv"), headers: true) do |row|
      if (team = TeamModel.find_by(name: row["Club"]))
        puts "Team #{team.name} already exists"
        next
      end
      team = TeamModel.create(
        name: row["Club"],
        team_logo: row["Club Logo"],
      )
      player = PlayerModel.find_by(team_id: team.id)
      player_id = player ? player.id : 0
      team.update(
        players_id: player_id
      )
      if team.save
        team = TeamModel.last
        puts "Team #{team.name} created"
      else
        puts "Team #{team.name} not created"
      end
    end
  end

  def down
    TeamModel.delete_all
  end
end
