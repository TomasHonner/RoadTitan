
<%@ page import="roadtitan.security.AppUser" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<title><g:message code="user.title" /></title>
	</head>
	<body>
		<div class="nav" role="navigation">
			<ul class="nav nav-tabs">
				<li><g:link class="list" action="index"><g:message code="user.title" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="user.new" /></g:link></li>
			</ul>
		</div>
		<div>
			<h1><g:message code="user.title" /></h1>
			<g:if test="${flash.message}">
			<div>${flash.message}</div>
			</g:if>
			<ul class="list-group">
			
				<g:if test="${appUserInstance?.appUserName}">
				<li class="list-group-item list-group-item-heading list-group-item-success">
					<span><g:message code="user.name" /></span
						<span><g:fieldValue bean="${appUserInstance}" field="appUserName"/></span>
				</li>
				</g:if>
			
				<g:if test="${appUserInstance?.appUserEmail}">
				<li class="list-group-item">
					<span><g:message code="user.email" /></span>
						<span><g:fieldValue bean="${appUserInstance}" field="appUserEmail"/></span>
				</li>
				</g:if>
			
				<g:if test="${appUserInstance?.appUserAddress}">
				<li class="list-group-item">
					<span><g:message code="user.address" /></span>
						<span><g:fieldValue bean="${appUserInstance}" field="appUserAddress"/></span>
				</li>
				</g:if>
			
				<g:if test="${appUserInstance?.company}">
				<li class="list-group-item">
					<span><g:message code="company.title2" /></span>
						<span><g:link controller="company" action="show" id="${appUserInstance?.company?.id}">${appUserInstance?.company?.encodeAsHTML()}</g:link></span>
				</li>
				</g:if>
			</ul>
			<g:form url="[resource:appUserInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="btn btn-lg btn-primary" action="edit" resource="${appUserInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="btn btn-lg btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
