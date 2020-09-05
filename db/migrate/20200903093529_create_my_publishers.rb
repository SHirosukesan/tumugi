class CreateMyPublishers < ActiveRecord::Migration[5.2]
  def change
    create_table :my_publishers do |t|
    	t.datetime "created_at", null: false
    	t.string "reset_password_token"
    	t.integer "item_id", null: false
	    t.string "firstname", null: false
	    t.string "lastname", null: false
	    t.string "address", null: false
	    t.integer "postalcode", null: false
	    t.integer "image", null: false
	    t.string "nicname", null: false
	    t.boolean "status", default: false, null: false
	    t.integer "number", null: false
	    t.integer "group_id", null: false
	    t.string "profile", null: false
	    t.integer "age", null: false
	    t.integer "competence", null: false
        t.string "lastname", null: false
        t.string "company_name", null: false
        t.timestamps
    end
  end
end
