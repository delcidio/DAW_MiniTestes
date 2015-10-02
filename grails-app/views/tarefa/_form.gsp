<%@ page import="minitetstes.Tarefa" %>



<div class="fieldcontain ${hasErrors(bean: tarefaInstance, field: 'membro', 'error')} required">
	<label for="membro">
		<g:message code="tarefa.membro.label" default="Membro" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="membro" name="membro.id" from="${minitetstes.Membro.list()}" optionKey="id" required="" value="${tarefaInstance?.membro?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: tarefaInstance, field: 'descricao', 'error')} ">
	<label for="descricao">
		<g:message code="tarefa.descricao.label" default="Descricao" />
		
	</label>
	<g:textField name="descricao" value="${tarefaInstance?.descricao}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: tarefaInstance, field: 'prazo', 'error')} required">
	<label for="prazo">
		<g:message code="tarefa.prazo.label" default="Prazo" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="prazo" precision="day"  value="${tarefaInstance?.prazo}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: tarefaInstance, field: 'titulo', 'error')} ">
	<label for="titulo">
		<g:message code="tarefa.titulo.label" default="Titulo" />
		
	</label>
	<g:textField name="titulo" value="${tarefaInstance?.titulo}"/>
</div>

