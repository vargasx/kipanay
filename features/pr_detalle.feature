Feature: Ver el detalle del PR

Scenario: el desarrollador da click a un PR de la lista y ve el detalle
	Given existe un pull request con parametros "alberto", "http://myjira.com", "http://mygithub.com", "NINGUNA"
	And el usuario abre la app
	When el usuario hace click en "detalle_0"
	Then debe ver "alberto"
	And debe ver "http://myjira.com"
	And debe ver "http://mygithub.com"
	And debe ver "NO CRITICO"
	And debe ver "NO SEGURIDAD"
	And debe ver "NINGUNA"
	And debe ver "NO PROBADO"