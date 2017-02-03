Feature: Como desarrollador debo poder agregar un PR para revision para mi usuario

Scenario: El usuario "mvargas" ve la pagina incial
	Given el usuario abre la app
	Then debe ver "Lista de Pull Requests"

Scenario: El usuario abre formulario de creacion de PR
	Given el usuario abre la app
	And el usuario hace click "crear-pr"
	Then debe ver "Crear Pull Request"

Scenario: El usuario crea un PR
	Given el usuario abre la app
	And el usuario hace click "crear-pr"
	And el usuario llena el formulario
	When el usuario hace click "guardar"
	Then debe ver "Pull Request creado"