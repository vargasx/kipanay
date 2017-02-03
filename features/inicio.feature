Feature: Como desarrollador debo poder agregar un PR para revision para mi usuario

Scenario: El usuario "mvargas" ve la pagina incial
	Given el usuario abre la app
	Then debe ver "Lista de Pull Requests"
Scenario: El usuario seleciona "mvargas" de la lista de usuarios y crea PR
	Given el usuario abre la app
	And el usuario hace click "crear"
	Then debe ver "Crear Pull Request"

