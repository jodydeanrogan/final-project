class CreateActivities < ActiveRecord::Migration[5.0]
  def change
    create_table :activities do |t|
      t.text :image_data
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
