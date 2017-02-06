require 'rails_helper'

RSpec.describe Clarifai, type: :model do

  before do
    @image_url = "https://samples.clarifai.com/metro-north.jpg"
    @token = Clarifai.get_token
    @token = @token[:access_token]
  end

  context "happy path" do
    it "should return a valid Clarifa token" do
      expect(Clarifai.get_token).to have_key(:code)
      expect(Clarifai.get_token).to have_key(:access_token)
      expect(Clarifai.get_token).to have_key(:expires_in)
    end
    it "should return a valid list of tags" do
      expect(Clarifai.get_tags(@token, @image_url)).to have_key(:code)
      expect(Clarifai.get_tags(@token, @image_url)).to have_key(:tags)
    end
  end

end
