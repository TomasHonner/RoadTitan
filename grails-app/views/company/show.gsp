
<%@ page import="roadtitan.core.Company" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<title><g:message code="company.title" /></title>
	</head>
	<body>
		<div class="nav" role="navigation">
			<ul class="nav nav-tabs">
				<li><g:link class="list" action="index"><g:message code="company.title" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="company.new" /></g:link></li>
			</ul>
		</div>
		<div id="show-company">
			<h1><g:message code="company.title2" /></h1>
			<g:if test="${flash.message}">
			<div>${flash.message}</div>
			</g:if>
			<ul class="list-group">
			
				<g:if test="${companyInstance?.companyName}">
				<li class="list-group-item list-group-item-heading list-group-item-success">
					<span><g:message code="company.name" /></span>
						<span><g:fieldValue bean="${companyInstance}" field="companyName"/></span>
				</li>
				</g:if>
			
				<g:if test="${companyInstance?.companyCode}">
				<li class="list-group-item">
					<span><g:message code="company.code" /></span>
						<span><g:fieldValue bean="${companyInstance}" field="companyCode"/></span>
				</li>
				</g:if>
			
				<g:if test="${companyInstance?.companyAddress}">
				<li class="list-group-item">
					<span><g:message code="company.address" /></span>
					
						<span><g:fieldValue bean="${companyInstance}" field="companyAddress"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${companyInstance?.companyCars}">
				<li class="list-group-item">
					<span><g:message code="company.cars" /></span>
					
						<g:each in="${companyInstance.companyCars}" var="c">
						<span>${c?.encodeAsHTML()}</span>
						</g:each>
					
				</li>
				</g:if>
			
			</ul>
			<g:form url="[resource:companyInstance, action:'delete']" method="DELETE">
				<fieldset>
					<g:link class="btn btn-lg btn-primary" action="edit" resource="${companyInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="btn btn-lg btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
