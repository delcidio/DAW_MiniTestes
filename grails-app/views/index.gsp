<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Welcome to Grails</title>
		<style type="text/css" media="screen">
			#status {
				background-color: #eee;
				border: .2em solid #fff;
				margin: 2em 2em 1em;
				padding: 1em;
				width: 12em;
				float: left;
				-moz-box-shadow: 0px 0px 1.25em #ccc;
				-webkit-box-shadow: 0px 0px 1.25em #ccc;
				box-shadow: 0px 0px 1.25em #ccc;
				-moz-border-radius: 0.6em;
				-webkit-border-radius: 0.6em;
				border-radius: 0.6em;
			}

			.ie6 #status {
				display: inline; /* float double margin fix http://www.positioniseverything.net/explorer/doubled-margin.html */
			}

			#status ul {
				font-size: 0.9em;
				list-style-type: none;
				margin-bottom: 0.6em;
				padding: 0;
			}

			#status li {
				line-height: 1.3;
			}

			#status h1 {
				text-transform: uppercase;
				font-size: 1.1em;
				margin: 0 0 0.3em;
			}

			#page-body {
				margin: 2em 1em 1.25em 18em;
			}

			h2 {
				margin-top: 1em;
				margin-bottom: 0.3em;
				font-size: 1em;
			}

			p {
				line-height: 1.5;
				margin: 0.25em 0;
			}

			#controller-list ul {
				list-style-position: inside;
			}

			#controller-list li {
				line-height: 1.3;
				list-style-position: inside;
				margin: 0.25em 0;
			}

			@media screen and (max-width: 480px) {
				#status {
					display: none;
				}

				#page-body {
					margin: 0 1em 1em;
				}

				#page-body h1 {
					margin-top: 0;
				}
			}
		</style>
	</head>
	<body>
		<a href="#page-body" class="skip"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div id="status" role="complementary">
			<h1>Miniteste-2</h1>
			<ul>
                <li><g:link controller="tarefa" action="buscaTarefasDoMembro">1.Terefas de um membro</g:link></li>
                <li><g:link controller="tarefa" action="buscaTarefaUmadata">2.Terefa de uma data</g:link></li>
                <li><g:link controller="tarefa" action="listarEntre2datas">3.Terefas entre 2 datas</g:link></li>
                <li><g:link controller="membro" action="listarOrdNome">4.Membros ord/nome</g:link></li>
				<li><g:link controller="membro" action="membsComCargXeTarfY">5.membsComCargXeTarfY</g:link></li>
				<li><g:link controller="membro" action="membrosQuantTarefas">6.Numero de Tarefas de um Membro</g:link></li>
				<li><g:link controller="tarefa" action="tarefasMembroCargo">7.Tarefas alocadas a um Membro de um Cargo</g:link></li>
                <!--
                    <li>Grails version: <g:meta name="app.grails.version"/></li>
                    <li>Groovy version: ${GroovySystem.getVersion()}</li>
                    <li>JVM version: ${System.getProperty('java.version')}</li>
                    <li>Reloading active: ${grails.util.Environment.reloadingAgentEnabled}</li>
                    <li>Controllers: ${grailsApplication.controllerClasses.size()}</li>
                    <li>Domains: ${grailsApplication.domainClasses.size()}</li>
                    <li>Services: ${grailsApplication.serviceClasses.size()}</li>
                    <li>Tag Libraries: ${grailsApplication.tagLibClasses.size()}</li>
                -->
			</ul>
			<h1>Miniteste-3</h1>
			<ul>
				<!--<g:each var="plugin" in="${applicationContext.getBean('pluginManager').allPlugins}">
					    <li>${plugin.name} - ${plugin.version}</li>
				    </g:each>
                -->
			</ul>
		</div>
		<div id="page-body" role="main">

			<div id="controller-list" role="navigation">
				<h2>Controllers Disponiveis:</h2>
				<ul>
					<g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName } }">
						<li class="controller"><g:link controller="${c.logicalPropertyName}">${c.fullName}</g:link></li>
					</g:each>
				</ul>
			</div>
		</div>
	</body>
</html>
