<%@ page import="roadtitan.security.AppUser" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<title><g:message code="user.edit" /></title>
	</head>
	<body>
		<div class="nav" role="navigation">
			<ul class="nav nav-tabs">
				<li><g:link class="list" action="index"><g:message code="user.title" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="user.new" /></g:link></li>
			</ul>
		</div>
		<div>
			<h1><g:message code="user.edit" /></h1>
			<g:if test="${flash.message}">
			<div>${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${appUserInstance}">
			<ul class="error">
				<g:eachError bean="${appUserInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form url="[resource:appUserInstance, action:'update']" method="PUT" >
				<g:hiddenField name="version" value="${appUserInstance?.version}" />
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<g:actionSubmit class="btn btn-lg btn-success" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
