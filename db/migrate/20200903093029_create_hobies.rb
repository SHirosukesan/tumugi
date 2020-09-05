class CreateHobies < ActiveRecord::Migration[5.2]
  def change
    create_table :hobies do |t|
    	t.integer "my_page_id", null: false
    	t.string "name", null: false
        t.timestamps
    end
  end
end
