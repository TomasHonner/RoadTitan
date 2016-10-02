<%@ page import="roadtitan.security.AppUser" %>



<div class="fieldcontain ${hasErrors(bean: appUserInstance, field: 'appUserName', 'error')} required list-group-item  list-group-item-success list-group-item-heading  ">
	<label for="appUserName">
		<g:message code="user.name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="appUserName" required="" value="${appUserInstance?.appUserName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: appUserInstance, field: 'appUserEmail', 'error')} required list-group-item ">
	<label for="appUserEmail">
		<g:message code="user.email" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="email" name="appUserEmail" required="" value="${appUserInstance?.appUserEmail}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: appUserInstance, field: 'appUserAddress', 'error')}  list-group-item ">
	<label for="appUserAddress">
		<g:message code="user.address" />
		
	</label>
	<g:textField name="appUserAddress" value="${appUserInstance?.appUserAddress}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: appUserInstance, field: 'company', 'error')}  list-group-item ">
	<label for="company">
		<g:message code="company.title2" />
		
	</label>
	<g:select id="company" name="company.id" from="${roadtitan.core.Company.list()}" optionKey="id" value="${appUserInstance?.company?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: appUserInstance, field: 'secUser', 'error')} required list-group-item ">
	<label for="secUser">
		<g:message code="" default="Sec User" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="secUser" name="secUser.id" from="${roadtitan.security.SecUser.list()}" optionKey="id" required="" value="${appUserInstance?.secUser?.id}" class="many-to-one"/>

</div>

