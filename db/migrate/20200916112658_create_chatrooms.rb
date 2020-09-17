class CreateChatrooms < ActiveRecord::Migration[5.2]
  def change
    create_table :chatrooms do |t|
	  t.references :user, foreign_key: true
      t.references :publisher, foreign_key: true
      t.timestamps
    end
  end
end
