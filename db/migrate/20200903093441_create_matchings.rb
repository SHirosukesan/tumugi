class CreateMatchings < ActiveRecord::Migration[5.2]
  def change
    create_table :matchings do |t|
		t.integer "matching_id"
		t.integer "publisher_id"
		t.integer "user_id"
		t.boolean "status", default: false, null: false
        t.timestamps
    end
  end
end
