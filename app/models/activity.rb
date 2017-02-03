class Activity < ApplicationRecord
  validates :image, :title, :description, presence: true
  validates :title, length: { in: 6..30 }
  validates :description, length: { in: 12..600}
  include ImageUploader[:image]
end
