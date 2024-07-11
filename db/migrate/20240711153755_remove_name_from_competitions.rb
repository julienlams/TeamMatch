class RemoveNameFromCompetitions < ActiveRecord::Migration[7.1]
  def change
    remove_column :competitions, :name, :string
  end
end
