class RemoveChatRoomIdFromMessages < ActiveRecord::Migration[7.1]
  def change
    remove_column :messages, :chat_room_id, :bigint
  end
end
