# frozen_string_literal: true

require_relative "../utils/dbMigration"

class TeamModel < ActiveRecord::Base
  self.table_name = "team_model"
  validates :name, presence: true
  validates :description, presence: true
  validates :owner, presence: true
  validates :team_logo, presence: true
  has_many :player_model
end

