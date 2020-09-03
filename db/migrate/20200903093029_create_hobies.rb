class CreateHobies < ActiveRecord::Migration[5.2]
  def change
    create_table :hobies do |t|

      t.timestamps
    end
  end
end
