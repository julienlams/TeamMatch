class MembershipRequest < ApplicationRecord
  belongs_to :user
  belongs_to :team

  enum status: { pending: 'pending', approved: 'approved', rejected: 'rejected' }

  validates :status, inclusion: { in: statuses.keys }
end
