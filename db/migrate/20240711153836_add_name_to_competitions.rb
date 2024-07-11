class AddNameToCompetitions < ActiveRecord::Migration[7.1]
  def change
    add_column :competitions, :name, :string
  end
end
