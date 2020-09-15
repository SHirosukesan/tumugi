class CreatePublisherImages < ActiveRecord::Migration[5.2]
  def change
    create_table :publisher_images do |t|
      t.integer "publisher_id"
      t.string "publisher_image_id"
      t.timestamps
    end
  end
end
