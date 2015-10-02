<%--
  Created by IntelliJ IDEA.
  User: Mabjaia
  Date: 9/23/15
  Time: 5:14 PM
  To change this template use File | Settings | File Templates.
--%>


<%@ page import="minitetstes.Tarefa" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta name="layout" content="main">
    <title>Buscar tarefas de um dado membro</title>
    <g:javascript library="prototype" />
</head>
<body>
    <a href="#list-tarefa" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
    <div class="nav" role="navigation">
        <ul>
            <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
            <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
        </ul>
    </div>

    <div id="list-tarefa" class="content scaffold-list" role="main">
        <h1>Buscar tarefas de um dado membro</h1>
        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>
        <g:hasErrors bean="${Tarefa}">
            <div class="errors">
                <g:renderErrors bean="${Tarefa}" as="list" />
            </div>
        </g:hasErrors>
        <g:formRemote name="ajaxForm" url="[controller: 'Tarefa', action: 'dosearch']" update="[success: 'message', failure: 'error']">
            <div class="dialog">
                <table>
                    <tr class='prop'>
                        <td valign='top' class='membro'>
                            <label for='membro'>Membro:</label>
                        </td>
                        <td valign='top' class='value' ${hasErrors(bean: Tarefa, field: 'membro', 'errors')}>
                            <input type="search" name="membro" value='${params?.membro}'/>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="buttons">
                <span class="formButton">
                    <input type="submit" value="Buscar">
                </span>
            </div>
        </g:formRemote>
    </div>

</body>
</html>