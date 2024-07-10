class Chatroom < ApplicationRecord
  belongs_to :team
  has_many :users, through: :team
  has_many :messages, dependent: :destroy
end
