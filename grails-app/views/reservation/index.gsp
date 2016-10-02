
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
				<li><g:link class="create" action="create"><g:message code="reservation.new" /></g:link></li>
			</ul>
		</div>
		<div >
			<h1><g:message code="reservation.title" /></h1>
			<g:if test="${flash.message}">
				<div>${flash.message}</div>
			</g:if>
			<table class="table table-striped">
			<thead class="TableHeadingColor">
					<tr>
						<g:sortableColumn property="reservationCode" title="${message(code: 'reservation.code')}" />
						<g:sortableColumn property="reservationName" title="${message(code: 'reservation.name')}" />
						<g:sortableColumn property="reservationDescription" title="${message(code: 'reservation.description')}" />
						<g:sortableColumn property="reservationFrom" title="${message(code: 'reservation.from')}" />
						<g:sortableColumn property="reservationTo" title="${message(code: 'reservation.to')}" />
					</tr>
				</thead>
				<tbody>
				<g:each in="${reservationInstanceList}" status="i" var="reservationInstance">
					<tr>
						<td><g:link action="show" id="${reservationInstance.id}">${fieldValue(bean: reservationInstance, field: "reservationCode")}</g:link></td>
						<td>${fieldValue(bean: reservationInstance, field: "reservationName")}</td>
						<td>${fieldValue(bean: reservationInstance, field: "reservationDescription")}</td>
						<td>${fieldValue(bean: reservationInstance, field: "reservationFrom")}</td>
						<td>${fieldValue(bean: reservationInstance, field: "reservationTo")}</td>
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${reservationInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
