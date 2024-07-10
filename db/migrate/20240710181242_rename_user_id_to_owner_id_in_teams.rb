class RenameUserIdToOwnerIdInTeams < ActiveRecord::Migration[7.1]
  def change
    rename_column :teams, :user_id, :owner_id
  end
end
