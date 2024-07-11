class AddCostToCompetitions < ActiveRecord::Migration[7.1]
  def change
    add_column :competitions, :cost, :decimal
  end
end
