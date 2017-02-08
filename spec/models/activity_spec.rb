require 'rails_helper'
require 'support/factory_girl'

RSpec.describe Activity, type: :model do
  before do
    @user = create(:user)
    @activity = create(:activity, activity_creator_id: @user.id)
    @task = create(:task, activity_id: @activity.id)
    @tags_match = ["xxx", "apple", "xxx"]
    @tags_no_match = ["xxx", "xxx", "xxx"]
  end
  describe "should have valid responses to actions with valid or invlaid attributes" do
    it "is valid with valid attributes and exists in database" do
      expect(@activity).to be_valid
      expect(Activity.first.id).to eq(@activity.id)
    end
    it "is not valid with invalid attributes" do
      expect(Activity.create(title: "Short", activity_creator_id: @user.id)).to_not be_valid
    end
    it "is valid to update attributes with valid attributes and changes are persisted" do
      expect(@activity.update(title: "This is change in title")).to be_truthy
      expect(Activity.first.title).to eq("This is change in title")
    end
    it "is invalid to update attributes with invalid attributes and changes are not persisted" do
      expect(@activity.update(title: "This title is far too long and shouldn't be persisted")).to_not be_truthy
      expect(Activity.first.title).to eq("Food Activity")
    end
    it "is valid to destroy activity and it's associations" do
      @activity.tasks.destroy_all
      @activity.activity_creator_id = ""
      expect(Activity.first.id).to eq(@activity.id)
      expect(@activity.delete).to be_truthy
    end
  end
  describe "should return valid responses to tags and activity id" do
    it "should return matching tag" do
      expect(Activity.check_tasks(@tags_match, @activity.id)).to be_truthy
    end
    it "should return no matching tag" do
      expect(Activity.check_tasks(@tags_no_match, @activity.id)).to_not be_truthy
    end
  end
end
