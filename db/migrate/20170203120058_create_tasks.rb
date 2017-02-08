class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.references :activity, foreign_key: true
      t.text :image_data
      t.text :learning_objectives
      t.text :instructions
      t.text :hints
      t.string :tag

      t.timestamps
    end
  end
end
