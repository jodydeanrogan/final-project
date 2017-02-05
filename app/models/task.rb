class Task < ApplicationRecord
  belongs_to :activity, inverse_of: :tasks
  include ImageUploader[:image]
end
