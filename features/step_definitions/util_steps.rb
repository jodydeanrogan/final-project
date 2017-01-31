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
