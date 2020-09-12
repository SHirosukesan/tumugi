class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
      t.integer :user_id, foreign_key: true
      t.integer :publisher_id, foreign_key: true
      # ※外部キーの時につける、データベース側でidが１のusermがいないときはエラーになる。
      t.boolean "reply", default: false, null: false
      t.timestamps
    end
  end
end
