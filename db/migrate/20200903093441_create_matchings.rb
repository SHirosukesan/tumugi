class CreateMatchings < ActiveRecord::Migration[5.2]
  def change
    create_table :matchings do |t|

      t.timestamps
    end
  end
end
