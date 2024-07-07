class RemoveLevelAndPalmaresFromSports < ActiveRecord::Migration[7.1]
  def change
    remove_column :sports, :level, :string
    remove_column :sports, :palmares, :string
  end
end
