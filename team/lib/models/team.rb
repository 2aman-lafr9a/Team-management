# frozen_string_literal: true

require_relative "../utils/dbMigration"

class Team < ActiveRecord::Base
  validates :name, presence: true
  validates :description, presence: true
  validates :owner, presence: true
  validates :team_logo, presence: true
  has_many :players
end

