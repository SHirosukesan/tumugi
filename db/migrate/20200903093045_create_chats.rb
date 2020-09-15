class CreateChats < ActiveRecord::Migration[5.2]
  def change
    create_table :chats do |t|
	    t.integer "chat_id"
	    t.integer "chatroom_id"
		t.integer "publisher_id"
		t.integer "user_id"
		t.string "cntent"
        t.timestamps
    end
  end
end
