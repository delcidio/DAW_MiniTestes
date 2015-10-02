<%--
  Created by IntelliJ IDEA.
  User: Mabjaia
  Date: 9/27/15
  Time: 4:10 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page import="minitetstes.Tarefa; minitetstes.Membro" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'membro.label', default: 'Membro')}" />
    <title>Membros com cargo X e Tarefa Y</title>
</head>
<body>
<a href="#list-membro" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
    </ul>
</div>
<div id="list-membro" class="content scaffold-list" role="main">
    <h1><g:message code="default.list.label" args="[entityName]" /></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>

    <fieldset class="form">
        <g:form action="doMembsComCargXeTarfY" method="POST">
            <div>
                <label for="cargo">Data:</label>
                <g:textField name="cargo" value="cargo" />
                <label for="Tarefa">Data:</label>
                <g:select name="tarefa"
                          from="${Tarefa.list()}"
                          optionKey="id" />
                <g:submitButton name="subm" class="submit" value="pesquisar" />
            </div>
         </g:form>
    </fieldset>

    <table>
        <thead>
        <tr>

            <g:sortableColumn property="password" title="${message(code: 'membro.password.label', default: 'Password')}" />

            <g:sortableColumn property="cargo" title="${message(code: 'membro.cargo.label', default: 'Cargo')}" />

            <g:sortableColumn property="nome" title="${message(code: 'membro.nome.label', default: 'Nome')}" />

            <g:sortableColumn property="username" title="${message(code: 'membro.username.label', default: 'Username')}" />

        </tr>
        </thead>
        <tbody>

        </tbody>
    </table>

</div>
</body>
</html>
