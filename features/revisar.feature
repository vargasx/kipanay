Feature: Como desarrollador puedo revisar pr de otro usuario

Scenario: Jose revisa el PR de Maria
	Given existe un pull request con parametros "alberto", "http://myjira.com", "http://mygithub.com", "dependencia"
	And el usuario abre la app
	And el usuario hace click link "revisar_0"
	Then debe ver "Revision de Pull Request"

Scenario: Jose aprueba el PR de Maria
	Given existe un pull request con parametros "alberto", "http://myjira.com", "http://mygithub.com", "dependencia"
	And el usuario abre la app
	And el usuario hace click link "revisar_0"
	And el revisor llena el formulario con campos "chris", "critico", "seguridad"
	And el usuario hace click "aprobar"
	Then debe ver "Pull Request Revisado"