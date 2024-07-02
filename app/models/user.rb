class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :user_sports
  has_many :sports, through: :user_sports
  has_many :users_teams
  has_many :teams, through: :users_teams
  has_many :messages
end
