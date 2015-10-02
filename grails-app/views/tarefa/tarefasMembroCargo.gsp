<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 9/29/2015
  Time: 8:47 AM
--%>

<%@ page import="minitetstes.Tarefa" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'tarefa.label', default: 'Tarefa')}" />
    <title>Lista de Tarefas</title>
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

    <fieldset class="form">
        <form action="dotarefasMembroCargo" method="POST">
            <div>
                <label for="cargo">Data:</label>
                <g:textField name="cargo"/>
                <label for="Tarefa">Data:</label>

                <g:select name="tarefa"
                          from="${Tarefa.list()}"
                          optionKey="id" />
                <div/>

                <g:submitButton name="subm" class="submit" value="pesquisar" />
        </form>
        <g:submitButton name="subm" class="submit" value="pesquisar" />
        </form>
    </fieldset>

    <table>
        <thead>
        <tr>

            <th><g:message code="tarefa.membro.label" default="Membro" /></th>

            <g:sortableColumn property="descricao" title="${message(code: 'tarefa.descricao.label', default: 'Descricao')}" />

            <g:sortableColumn property="prazo" title="${message(code: 'tarefa.prazo.label', default: 'Prazo')}" />

            <g:sortableColumn property="titulo" title="${message(code: 'tarefa.titulo.label', default: 'Titulo')}" />

        </tr>
        </thead>
        <tbody>
        <g:each in="${tarefaInstanceList}" status="i" var="tarefaInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td><g:link action="show" id="${tarefaInstance.id}">${fieldValue(bean: tarefaInstance, field: "membro")}</g:link></td>

                <td>${fieldValue(bean: tarefaInstance, field: "descricao")}</td>

                <td><g:formatDate date="${tarefaInstance.prazo}" /></td>

                <td>${fieldValue(bean: tarefaInstance, field: "titulo")}</td>

            </tr>
        </g:each>
        </tbody>
    </table>
    <div class="pagination">
        <g:paginate total="${tarefaInstanceTotal}" />
    </div>
</div>
</body>
</html>
