# frozen_string_literal: true

require_relative '../utils/dbMigration'

class PlayerModel < ActiveRecord::Base
  self.table_name = 'player_model'
  validates :name, presence: true
  validates :age, presence: true
  validates :photo, presence: true
  validates :nationality, presence: true
  validates :flag, presence: true
  validates :overall, presence: true
  validates :potential, presence: true
  validates :position, presence: true
  validates :value, presence: true
  validates :wage, presence: true
  validates :preferred_foot, presence: true
  validates :international_reputation, presence: true
  validates :weak_foot, presence: true
  validates :skill_moves, presence: true
  validates :work_rate, presence: true
  validates :body_type, presence: true
  validates :height, presence: true
  validates :weight, presence: true

  belongs_to :team_model
end
