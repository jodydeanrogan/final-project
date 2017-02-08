class AddActivityCreatorRefToActivities < ActiveRecord::Migration[5.0]
  def change
    add_reference :activities, :activity_creator#, foreign_key: true
  end
end
