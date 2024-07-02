class Competition < ApplicationRecord
  belongs_to :sport
  has_many :teams
end
