When(/^I navigate to "([^"]*)"$/) do |path|
  visit(path)
end

Then(/^I should see the "([^"]*)" form label$/) do |label|
  expect(page.body).to match(label)
end

Then(/^I should be required to fill in "([^"]*)" with a "([^"]*)" when registering$/) do |selector, attribute|
  fill_in(selector, :with => '')
  click_on("Sign up")
  expect(page.body).to match("#{attribute} can't be blank")
end
