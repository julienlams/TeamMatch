class RemoveForeignKeyFromMessages < ActiveRecord::Migration[7.1]
  def change
    remove_foreign_key :messages, :chatrooms  # Assumes the foreign key was named 'chatrooms'
  end
end
