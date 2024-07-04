class ChangeChatroomTableName < ActiveRecord::Migration[7.1]
  def change
    rename_table :chat_rooms, :chatrooms
  end
end
