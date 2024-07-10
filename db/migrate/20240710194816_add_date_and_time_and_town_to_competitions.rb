class AddDateAndTimeAndTownToCompetitions < ActiveRecord::Migration[7.1]
  def change
    add_column :competitions, :date, :date
    add_column :competitions, :time, :time
    add_column :competitions, :town, :string
  end
end
