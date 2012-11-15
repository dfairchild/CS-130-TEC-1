<%@ page import="myadventure.Venture" %>



<div class="fieldcontain ${hasErrors(bean: ventureInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="venture.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${ventureInstance?.name}"/>
</div>

