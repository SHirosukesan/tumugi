class CreateChats < ActiveRecord::Migration[5.2]
  def change
    create_table :chats do |t|
	    t.integer "chat_id"
		t.integer "my_publisher_id"
		t.integer "my_page_id"
        t.timestamps
    end
  end
end
