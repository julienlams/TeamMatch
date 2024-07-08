class AddLevelAndPalmaresToUserSports < ActiveRecord::Migration[7.1]
  def change
    add_column :user_sports, :level, :string
    add_column :user_sports, :palmares, :string
  end
end
