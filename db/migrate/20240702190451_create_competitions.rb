class CreateCompetitions < ActiveRecord::Migration[7.1]
  def change
    create_table :competitions do |t|
      t.references :sport, null: false, foreign_key: true
      t.integer :number_of_teams
      t.datetime :date_time
      t.string :address
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
