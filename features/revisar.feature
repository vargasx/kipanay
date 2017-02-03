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
	And completa el campo de revisor con "jose" y lo aprueba
	Then debe ver "Pull Request Revisado"