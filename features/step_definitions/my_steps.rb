
Given(/^el usuario abre la app$/) do
  visit "/"
end

Then(/^debe ver "([^"]*)"$/) do |text|
  expect(page.body).to match /#{text}/m
end

Given(/^el usuario hace click "([^"]*)"$/) do |button|
  click_button(button)
end
