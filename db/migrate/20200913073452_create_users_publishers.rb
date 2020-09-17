class CreateUsersPublishers < ActiveRecord::Migration[5.2]
  def change
    create_table :users_publishers do |t|
      t.integer :user_id, foreign_key: true
      t.integer :publisher_id, foreign_key: true
      t.boolean :follow_permission, default: false, null: false
      t.timestamps
    end
  end
end
