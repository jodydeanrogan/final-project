class Activity < ApplicationRecord

  belongs_to :activity_creator, class_name: "User", inverse_of: :created_activities
  has_many :activity_users
  has_many :tasks, inverse_of: :activity
  accepts_nested_attributes_for :tasks, allow_destroy: true
  validates :image, :title, :description, presence: true
  validates :title, length: { in: 6..30 }
  validates :description, length: { in: 12..600}
  include ImageUploader[:image]

  def self.check_tasks(tags, activity_id)
    @activity = Activity.find(activity_id)
    @tasks = @activity.tasks.map {|task| [task.id,task.tag]}
    tags.each do |tag|
      @check = @activity.tasks.select{|task| task.tag == tag}
      break unless @check == []
    end
    return @check[0]
  end

end
