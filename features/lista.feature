Feature: Como desarrollador debo poder ver la lista de PR
Scenario: El usuario ve la pagina incial
	Given el usuario abre la app
	Then debe ver "Lista de Pull Requests"

Scenario: El usuario ve un PR en la lista
	Given el usuario abre la app
	Then debe ver "Creador"
	And debe ver "Jira"
	And debe ver "PR"
  And debe ver "Critico?"
  And debe ver "Seguridad"
  And debe ver "Dependencias"
  And debe ver "Probado-stg?"
