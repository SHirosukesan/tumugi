class CreateGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
    	t.integer "my_page_id", null: false
    	t.string "name", null: false
        t.timestamps
    end
  end
end
