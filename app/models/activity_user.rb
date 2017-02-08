class ActivityUser < ApplicationRecord
  belongs_to :user
  belongs_to :activity
  has_many :photos
end
