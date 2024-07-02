class CreateSports < ActiveRecord::Migration[7.1]
  def change
    create_table :sports do |t|
      t.string :level
      t.string :palmares
      t.string :name

      t.timestamps
    end
  end
end
