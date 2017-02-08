class Photo < ApplicationRecord
  belongs_to :activity_user
  belongs_to :task
  include ImageUploader[:image]
end
