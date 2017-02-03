
Given(/^el usuario abre la app$/) do
  visit "/"
end

Then(/^debe ver "([^"]*)"$/) do |text|
  expect(page.body).to match /#{text}/m
end

Given(/^el usuario hace click "([^"]*)"$/) do |button|
  click_button(button)
end
Given(/^el usuario hace click link "([^"]*)"$/) do |button|
  click_link(button)
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

Given(/^el usuario llena el formulario con campos "([^"]*)", "([^"]*)", "([^"]*)"$/) do |creador, jira, github|
  fill_in("creador", :with => creador)
  fill_in("link_github", :with => github)
  fill_in("link_jira", :with => jira)
end

Given(/^existe un pull request con parametros "([^"]*)", "([^"]*)", "([^"]*)", "([^"]*)"$/) do |creador, github, jira, dependencias|
  pr = PullRequest.new
  pr.creador = creador
  pr.link_github = github
  pr.link_jira = jira
  pr.dependencias = dependencias

  pr.save
end

When(/^el usuario hace click en "([^"]*)"$/) do |boton_ver_detalle|
  click_link(boton_ver_detalle)
end

Given(/^completa el campo de revisor con "([^"]*)" y lo aprueba$/) do |revisor|
  fill_in("revisor", :with => revisor)
  click_button("aprobar")
end

Given(/^el revisor llena el formulario con campos "([^"]*)", "([^"]*)", "([^"]*)"$/) do |revisor, critico, seguridad|
  fill_in("revisor", :with => revisor)
  check("revision_seguridad")
  check("critico")
end
