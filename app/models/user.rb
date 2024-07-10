class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :user_sports
  has_many :sports, through: :user_sports
  has_many :users_teams
  has_many :teams_as_participant, through: :users_teams, source: :team
  has_many :owned_teams, class_name: 'Team', foreign_key: 'owner_id', dependent: :destroy
  has_many :messages
end
