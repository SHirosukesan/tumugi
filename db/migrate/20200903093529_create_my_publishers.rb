class CreateMyPublishers < ActiveRecord::Migration[5.2]
  def change
    create_table :my_publishers do |t|

      t.timestamps
    end
  end
end
