# frozen_string_literal: true

require 'active_record'

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
