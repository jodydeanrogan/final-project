class CreatePhotos < ActiveRecord::Migration[5.0]
  def change
    create_table :photos do |t|
      t.references :activity_user, foreign_key: true
      t.references :task, foreign_key: true
      t.text :image_data

      t.timestamps
    end
  end
end
