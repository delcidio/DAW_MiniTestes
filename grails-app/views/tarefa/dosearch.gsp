<%--
  Created by IntelliJ IDEA.
  User: Mabjaia
  Date: 9/23/15
  Time: 6:07 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page import="minitetstes.Tarefa" %>
<!DOCTYPE html>
<html>
<head>
  <title></title>
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
        <h1><g:message code="default.list.label" args="[entityName]" /></h1>
        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>
    <table>
        <thead>
        <tr>

            <th><g:message code="tarefa.membro.label" default="Membro" /></th>

            <g:sortableColumn property="descricao" title="${message(code: 'tarefa.descricao.label', default: 'Descricao')}" />

            <g:sortableColumn property="prazo" title="${message(code: 'tarefa.prazo.label', default: 'Prazo')}" />

            <g:sortableColumn property="titulo" title="${message(code: 'tarefa.titulo.label', default: 'Titulo')}" />
            <th></th>
        </tr>
        </thead>
        <tbody>
        <g:each in="${tarefas}" status="i" var="tarefaInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td><g:link action="show" id="${tarefaInstance.id}">${fieldValue(bean: tarefaInstance, field: "membro")}</g:link></td>

                <td>${fieldValue(bean: tarefaInstance, field: "descricao")}</td>

                <td><g:formatDate date="${tarefaInstance.prazo}" /></td>

                <td>${fieldValue(bean: tarefaInstance, field: "titulo")}</td>
                <td class="actionButton">
                    <span class="actionButton">
                        <g:link action="show" id="${it.id}">Show</g:link>
                    </span>
                </td>
            </tr>
        </g:each>
        </tbody>
    </table>

</body>
</html>