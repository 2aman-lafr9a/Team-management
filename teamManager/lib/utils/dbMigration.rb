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
    create_table :teamManager_model do |t|
      t.string :name
      t.integer :age
      t.string :surname
    end
  end
end

class AddTeamIdToTeamManager < ActiveRecord::Migration[6.0]
  def change
    add_column :teamManager_model, :team_id, :integer
  end
end
