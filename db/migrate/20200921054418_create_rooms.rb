class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      t.integer "room_id"
      t.references :user,foreign_key: true
      t.timestamps
    end
  end
end
