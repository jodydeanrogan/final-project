class CreateClarifais < ActiveRecord::Migration[5.0]
  def change
    create_table :clarifais do |t|
      t.string :access_token
      t.string :expires_in

      t.timestamps
    end
  end
end
