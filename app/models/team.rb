class Team < ApplicationRecord
  belongs_to :owner, class_name: 'User', foreign_key: 'owner_id'
  belongs_to :competition
  has_many :users_teams
  has_many :participants, through: :users_teams, source: :user
  has_one :chatroom, dependent: :destroy

  validates :name, presence: true
  validates :number_max_of_participants, presence: true, numericality: { greater_than_or_equal_to: 0, message: "doit être un nombre positif" }

  after_create :create_chatroom

  private

  def create_chatroom
    Chatroom.create!(team: self)
  end
end
