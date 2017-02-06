Given(/^sample data is loaded$/) do
  require './db/seeds'
  extend SeedData
end

Given(/^I am logged in as "([^"]*)"$/) do |email|
  log_on_as(email)
end

When(/^I navigate to "([^"]*)"$/) do |path|
  visit(path)
end

Then(/^I should see "([^"]*)" on the page$/) do |content|
  page.should have_content(content)
end

When(/^I fill in "([^"]*)" with "([^"]*)"$/) do |field, text|
  fill_in(field, :with => text)
end

Then(/^I click "([^"]*)"$/) do |button_value|
  click_on(button_value)
end

When(/^I add image to "([^"]*)"$/) do |field|
  Capybara.ignore_hidden_elements = false
  page.attach_file(field, Rails.root + 'app/assets/images/default-image.jpg')
  save_and_open_page
end
