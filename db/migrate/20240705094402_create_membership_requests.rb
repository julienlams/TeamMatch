class CreateMembershipRequests < ActiveRecord::Migration[7.1]
  def change
    create_table :membership_requests do |t|
      t.references :user, null: false, foreign_key: true
      t.references :team, null: false, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
