class AddUserIdToCompetitions < ActiveRecord::Migration[7.1]
  def change
    add_column :competitions, :user_id, :bigint
  end
end
