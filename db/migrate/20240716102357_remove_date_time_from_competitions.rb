class RemoveDateTimeFromCompetitions < ActiveRecord::Migration[7.1]
  def change
    remove_column :competitions, :date_time, :datetime
  end
end
