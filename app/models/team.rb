class Team < ApplicationRecord
  belongs_to :user
  belongs_to :competition
  has_many :users_teams
  has_many :users, through: :users_teams
  has_one :chat_room
  validates :number_max_of_participants, presence: true, numericality: { greater_than_or_equal_to: 0, message: "doit être un nombre positif" }
end
