class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
	    t.integer "notification_id"
		t.integer "my_publisher_id"
		t.integer "my_page_id"
        t.timestamps
    end
  end
end
