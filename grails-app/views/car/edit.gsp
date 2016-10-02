<%@ page import="roadtitan.core.Car" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<title><g:message code="car.edit" /></title>
	</head>
	<body>
		<div class="nav" role="navigation">
			<ul class="nav nav-tabs">
				<li><g:link class="list" action="index"><g:message code="car.title" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="car.new" /></g:link></li>
			</ul>
		</div>
		<div id="edit-car">
			<h1><g:message/></h1>
			<g:if test="${flash.message}">
			<div>${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${carInstance}">
			<ul class="error" role="alert">
				<g:eachError bean="${carInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form url="[resource:carInstance, action:'update']" method="PUT" >
				<g:hiddenField name="version" value="${carInstance?.version}" />
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<g:actionSubmit class="btn btn-lg btn-primary" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
