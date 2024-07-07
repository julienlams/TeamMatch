class AddDescriptionToCompetitions < ActiveRecord::Migration[7.1]
  def change
    add_column :competitions, :description, :text
  end
end
