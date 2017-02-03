
Given(/^el usuario abre la app$/) do
  visit "/"
end

Then(/^debe ver "([^"]*)"$/) do |text|
  expect(page.body).to match /#{text}/m
end

Given(/^el usuario hace click "([^"]*)"$/) do |button|
  click_button(button)
end

Given(/^el usuario llena el formulario$/) do
  fill_in("creador", :with => "mvargas")
  fill_in("link_github", :with => "http://githu.com")
  fill_in("link_jira", :with => "http://jira.com")
  check("critico")
  check("revision_seguridad")
  check("revision_staging")
  fill_in("dependencias", with: "ninguna")
end
