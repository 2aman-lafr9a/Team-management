# frozen_string_literal: true

require_relative '../utils/dbMigration'

class TeamManagerModel < ActiveRecord::Base
  self.table_name = 'teamManager_model'
  validates :name, presence: true
  validates :age, presence: true
  validates :surname, presence: true
  validates :wallet, presence: true
  has_one :team_model
end
