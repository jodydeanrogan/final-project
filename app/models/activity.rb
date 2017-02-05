class Activity < ApplicationRecord
  has_many :tasks, inverse_of: :activity
  accepts_nested_attributes_for :tasks, allow_destroy: true
  validates :image, :title, :description, presence: true
  validates :title, length: { in: 6..30 }
  validates :description, length: { in: 12..600}
  include ImageUploader[:image]
end
