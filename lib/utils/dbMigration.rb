# frozen_string_literal: true

require "active_record"

ActiveRecord::Base.establish_connection(
  adapter: "mysql2",
  host: "localhost",
  username: "root",
  password: "password",
  database: "TeamManagement"
)

class Create < ActiveRecord::Migration[6.0]
  def change
    create_table :teams do |t|
      t.string :name
      t.string :description
      t.string :owner
      t.string :team_logo
    end
    create_table :players do |t|
      t.string :name
      t.integer :age
      t.string :photo
      t.string :nationality
      t.string :flag
      t.integer :overall
      t.integer :potential
      t.string :position
      t.integer :team_id
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

class AddPlayersIdToTeam < ActiveRecord::Migration[6.0]
  def change
    add_column :teams, :players_id, :integer
  end
end
