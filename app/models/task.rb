class Task < ApplicationRecord
  belongs_to :activity, inverse_of: :tasks
  has_many :photos
  include ImageUploader[:image]
end
