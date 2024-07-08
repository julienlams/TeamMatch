class Team < ApplicationRecord
  belongs_to :user
  belongs_to :competition
  has_many :users_teams
  has_many :users, through: :users_teams
  has_one :chat_room
end
