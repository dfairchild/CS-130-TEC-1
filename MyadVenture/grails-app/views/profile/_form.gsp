<%@ page import="myadventure.Profile" %>



<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'email', 'error')} ">
	<label for="email">
		<g:message code="profile.email.label" default="Email" />
		
	</label>
	<g:textField name="email" value="${profileInstance?.email}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'first_name', 'error')} ">
	<label for="first_name">
		<g:message code="profile.first_name.label" default="Firstname" />
		
	</label>
	<g:textField name="first_name" value="${profileInstance?.first_name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'last_name', 'error')} ">
	<label for="last_name">
		<g:message code="profile.last_name.label" default="Lastname" />
		
	</label>
	<g:textField name="last_name" value="${profileInstance?.last_name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'password', 'error')} ">
	<label for="password">
		<g:message code="profile.password.label" default="Password" />
		
	</label>
	<g:textField name="password" value="${profileInstance?.password}"/>
</div>

