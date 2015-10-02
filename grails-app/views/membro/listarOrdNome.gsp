<%--
  Created by IntelliJ IDEA.
  User: Mabjaia
  Date: 9/27/15
  Time: 7:25 AM
  To change this template use File | Settings | File Templates.
--%>


<%@ page import="minitetstes.Membro" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'membro.label', default: 'Membro')}" />
    <title>Membros ordenados por nome</title>
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

    <table>
        <thead>
        <tr>
            <g:sortableColumn property="username" title="${message(code: 'membro.username.label', default: 'Username')}" />

            <g:sortableColumn property="nome" title="${message(code: 'membro.nome.label', default: 'Nome')}" />

            <!-- <g:sortableColumn property="password" title="${message(code: 'membro.password.label', default: 'Password')}" />-->

            <g:sortableColumn property="cargo" title="${message(code: 'membro.cargo.label', default: 'Cargo')}" />


        </tr>
        </thead>
        <tbody>
        <g:each in="${membroInstanceList}" status="i" var="membroInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <!--<td><g:link action="show" id="${membroInstance.id}">${fieldValue(bean: membroInstance, field: "password")}</g:link></td>-->
                <td>${fieldValue(bean: membroInstance, field: "username")}</td>

                <td>${fieldValue(bean: membroInstance, field: "nome")}</td>

                <td>${fieldValue(bean: membroInstance, field: "cargo")}</td>



            </tr>
        </g:each>
        </tbody>
    </table>
    <div class="pagination">
        <g:paginate total="${membroInstanceTotal}" />
    </div>
</div>
</body>
</html>
