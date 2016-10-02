
<%@ page import="roadtitan.core.Car" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<title><g:message code="car.title" /></title>
	</head>
	<body>
		<div class="nav" role="navigation">
			<ul class="nav nav-tabs">
				<li><g:link class="list" action="index"><g:message code="car.title" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="car.new" /></g:link></li>
			</ul>
		</div>
		<div id="show-car">
			<h1><g:message code="car.title" /></h1>
			<g:if test="${flash.message}">
			<div>${flash.message}</div>
			</g:if>
			<ul class="list-group">

				<g:if test="${carInstance?.carName}">
				<li class="list-group-item list-group-item-heading list-group-item-success">
					<span id="carName-label"><g:message code="car.name" /></span>
					
						<span><g:fieldValue bean="${carInstance}" field="carName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${carInstance?.carInventoryCode}">
				<li class="list-group-item">
					<span id="carInventoryCode-label"><g:message code="car.inventoryCode" /></span>
					
						<span><g:fieldValue bean="${carInstance}" field="carInventoryCode"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${carInstance?.carSpz}">
				<li class="list-group-item">
					<span id="carSpz-label"><g:message code="car.spz" /></span>
					
						<span><g:fieldValue bean="${carInstance}" field="carSpz"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${carInstance?.carType}">
				<li class="list-group-item">
					<span><g:message code="car.type" /></span>
					
						<span><g:fieldValue bean="${carInstance}" field="carType"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${carInstance?.company}">
				<li class="list-group-item">
					<span><g:message code="car.company" /></span>
					
						<span>${carInstance?.company?.encodeAsHTML()}</span>
					
				</li>
				</g:if>
			
			</ul>
			<g:form url="[resource:carInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="btn btn-lg btn-primary" action="edit" resource="${carInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="btn btn-lg btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
