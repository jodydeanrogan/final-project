require 'spec_helper'
OmniAuth.config.test_mode = true

RSpec.feature 'Facebook login management', type: :feature do

  describe "valid login with Facebook" do

    before do
      OmniAuth.config.test_mode = true
      mock_valid_auth_hash
    end

    it 'should let users login with Facebook credentials' do
      visit '/home'
      click_on 'Login with Facebook'
      expect(page.body).to match("Successfully authenticated from Facebook account.")
      expect(User.first).to be_truthy
      expect(User.first.provider).to eq('facebook')
      expect(User.first.provider).not_to eq('twitter')
      expect(User.first.uid).to eq('1234')
      expect(User.first.uid).not_to eq('5678')
    end

  end

  describe "invalid login with Facebook" do

    before do
      OmniAuth.config.test_mode = true
      mock_invalid_auth_hash
    end

    it 'should redirect user to registration on home page' do
      visit '/home'
      click_on 'Login with Facebook'
      expect(page.body).to match("Register")
    end

  end

end

def mock_valid_auth_hash
  OmniAuth.config.mock_auth[:default] = OmniAuth::AuthHash.new(
    'provider' => 'facebook',
    'uid' => '1234',
    'info' => {
      'name' => 'mockuser',
      'image' => 'mock_user_thumbnail_url',
      'first_name' => 'joe',
      'last_name' => 'bloggs',
      'email' => 'joebloggs@test.com',
      'urls' => {
        'public_profile' => 'http://test.test/public_profile'
      }
    }
  )
end

def mock_invalid_auth_hash
  OmniAuth.config.mock_auth[:default] = OmniAuth::AuthHash.new(
    'info' => {
      'name' => 'mockuser',
      'image' => 'mock_user_thumbnail_url',
      'first_name' => 'joe',
      'last_name' => 'bloggs',
      'urls' => {
        'public_profile' => 'http://test.test/public_profile'
      }
    }
  )
end
