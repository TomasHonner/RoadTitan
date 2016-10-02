<%@ page import="roadtitan.reservation.Reservation" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<title><g:message code="reservation.edit" /></title>
	</head>
	<body>
		<div class="nav" role="navigation">
			<ul class="nav nav-tabs">
				<li><g:link class="list" action="index"><g:message code="reservation.title" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="reservation.new" /></g:link></li>
			</ul>
		</div>
		<div>
			<h1><g:message code="reservation.edit" /></h1>
			<g:if test="${flash.message}">
			<div>${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${reservationInstance}">
			<ul class="error" role="alert">
				<g:eachError bean="${reservationInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form url="[resource:reservationInstance, action:'update']" method="PUT" >
				<g:hiddenField name="version" value="${reservationInstance?.version}" />
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
