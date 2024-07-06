class Competition < ApplicationRecord
  belongs_to :sport
  has_many :teams

  validates :number_of_teams, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :sport_id, :date_time, :address, :name, presence: true
end
