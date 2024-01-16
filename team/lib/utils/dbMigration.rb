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
