
<%@ page import="roadtitan.reservation.Reservation" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<title><g:message code="reservation.title" /></title>
	</head>
	<body>
		<div class="nav" role="navigation">
			<ul class="nav nav-tabs">
				<li><g:link class="list" action="index"><g:message code="reservation.title" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="reservation.new" /></g:link></li>
			</ul>
		</div>
		<div>
			<h1><g:message code="reservation.title" /></h1>
			<g:if test="${flash.message}">
			<div>${flash.message}</div>
			</g:if>
			<ul class="list-group">

				<g:if test="${reservationInstance?.reservationCode}">
				<li class="list-group-item list-group-item-heading list-group-item-success">
					<span><g:message code="reservation.code" /></span>
					
						<span><g:fieldValue bean="${reservationInstance}" field="reservationCode"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${reservationInstance?.reservationName}">
				<li class="list-group-item">
					<span><g:message code="reservation.name" /></span>
					
						<span><g:fieldValue bean="${reservationInstance}" field="reservationName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${reservationInstance?.reservationDescription}">
				<li class="list-group-item">
					<span><g:message code="reservation.description" /></span>
					
						<span><g:fieldValue bean="${reservationInstance}" field="reservationDescription"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${reservationInstance?.reservationFrom}">
				<li class="list-group-item">
					<span><g:message code="reservation.from" /></span>
					
						<span><g:fieldValue bean="${reservationInstance}" field="reservationFrom"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${reservationInstance?.reservationTo}">
				<li class="list-group-item">
					<span><g:message code="reservation.to" /></span>
					
						<span><g:fieldValue bean="${reservationInstance}" field="reservationTo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${reservationInstance?.car}">
				<li class="list-group-item">
					<span><g:message code="reservation.car" /></span>
					
						<span>${reservationInstance?.car?.encodeAsHTML()}</span>
					
				</li>
				</g:if>
			
				<g:if test="${reservationInstance?.user}">
				<li class="list-group-item">
					<span><g:message code="reservation.user" /></span>
					
						<span>${reservationInstance?.user?.encodeAsHTML()}</span>
					
				</li>
				</g:if>

				<g:if test="${reservationInstance?.reservationAproved}">
					<li class="list-group-item">
						<span><g:message code="reservation.aproved" /></span>

						<span><g:formatBoolean boolean="${reservationInstance?.reservationAproved}" /></span>

					</li>
				</g:if>
			
			</ul>
			<g:form url="[resource:reservationInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="btn btn-lg btn-primary" action="edit" resource="${reservationInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="btn btn-lg btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
