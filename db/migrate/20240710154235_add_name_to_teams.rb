class AddNameToTeams < ActiveRecord::Migration[7.1]
  def change
    add_column :teams, :name, :string
  end
end
