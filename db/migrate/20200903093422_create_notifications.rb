class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
	    t.integer "notification_id"
		t.integer "publisher_id"
		t.integer "user_id"
        t.timestamps
    end
  end
end
