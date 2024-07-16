class RenameTownToCityInCompetitions < ActiveRecord::Migration[7.1]
  def change
    rename_column :competitions, :town, :city
  end
end
