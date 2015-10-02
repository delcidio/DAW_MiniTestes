<%@ page import="minitetstes.Membro" %>



<div class="fieldcontain ${hasErrors(bean: membroInstance, field: 'tarefas', 'error')} ">
	<label for="tarefas">
		<g:message code="membro.tarefas.label" default="Tarefas" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${membroInstance?.tarefas?}" var="t">
    <li><g:link controller="tarefa" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="tarefa" action="create" params="['membro.id': membroInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'tarefa.label', default: 'Tarefa')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: membroInstance, field: 'password', 'error')} required">
	<label for="password">
		<g:message code="membro.password.label" default="Password" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="password" name="password" maxlength="15" required="" value="${membroInstance?.password}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: membroInstance, field: 'cargo', 'error')} ">
	<label for="cargo">
		<g:message code="membro.cargo.label" default="Cargo" />
		
	</label>
	<g:textField name="cargo" value="${membroInstance?.cargo}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: membroInstance, field: 'nome', 'error')} ">
	<label for="nome">
		<g:message code="membro.nome.label" default="Nome" />
		
	</label>
	<g:textField name="nome" value="${membroInstance?.nome}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: membroInstance, field: 'username', 'error')} ">
	<label for="username">
		<g:message code="membro.username.label" default="Username" />
		
	</label>
	<g:textField name="username" value="${membroInstance?.username}"/>
</div>

