class CreateUsersPublishers < ActiveRecord::Migration[5.2]
  def change
    create_table :users_publishers do |t|
      t.integer :follower_id, foreign_key: true
      t.integer :followed_id, foreign_key: true
      t.boolean :follower_permission, default: false, null: false
      t.boolean :followed_permission, default: false, null: false
      t.timestamps
    end
  end
end
