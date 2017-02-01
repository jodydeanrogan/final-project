Then(/^I should see the "([^"]*)" form label$/) do |label|
  expect(page.body).to match(label)
end

Then(/^I should be required to fill in "([^"]*)" with a "([^"]*)" when registering$/) do |selector, attribute|
  fill_in(selector, :with => '')
  within('div.actions') do
    click_on("Sign up")
  end
  expect(page.body).to match("#{attribute} can't be blank")
end

Then(/^I should be required to fill in "([^"]*)" with a "([^"]*)" when signing in$/) do |selector, attribute|
  fill_in(selector, :with => '')
  within('div.actions') do
    click_on("Login")
  end
  expect(page.body).to match("Log in")
end

Then(/^I should be required to fill in "([^"]*)" with a "([^"]*)" when requesting reset instructions$/) do |selector, attribute|
  fill_in(selector, :with => '')
  within('div.actions') do
    click_on("Send me reset instructions")
  end
  expect(page.body).to match("#{attribute} can't be blank")
end
