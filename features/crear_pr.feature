Feature: Como desarrollador debo poder agregar un PR para revision para mi usuario

Scenario: El usuario crea un PR
	Given el usuario abre la app
	And el usuario hace click "crear-pr"
	And el usuario llena el formulario
	When el usuario hace click "guardar"
	Then debe ver "Pull Request creado"

Scenario: El usuario intenta crear un PR pero llena los campos obligatorios
	Given el usuario abre la app
	And el usuario hace click "crear-pr"
	And el usuario hace click "guardar"
	Then debe ver "Los campos marcados con \* son obligatorios"

Scenario: El usuario crea un PR y lo ve en la lista
	Given el usuario abre la app
	And el usuario hace click "crear-pr"
	And el usuario llena el formulario con campos "chris", "http://jira.com/chris", "http://github.com/chris"
	And el usuario hace click "guardar"
	When el usuario hace click link "volver"
	Then debe ver "http://jira.com/chris"
	And debe ver "http://github.com/chris"