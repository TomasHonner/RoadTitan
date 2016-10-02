
<%@ page import="roadtitan.core.Car" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<title><g:message code="car.title" /></title>
	</head>
	<body>
		<div class="nav" role="navigation">
			<ul class=" nav nav-tabs">
				<li><g:link class="create" action="create"><g:message code="car.new" /></g:link></li>
			</ul>
		</div>
		<div id="list-car">
			<h1><g:message code="car.title" /></h1>
			<g:if test="${flash.message}">
				<div class="alert-info">${flash.message}</div>
			</g:if>
			<table class="table table-striped">
			<thead class="TableHeadingColor">
					<tr>
						<g:sortableColumn property="carName" title="${message(code: 'car.name')}" />
						<g:sortableColumn property="carInventoryCode" title="${message(code: 'car.inventoryCode')}" />
						<g:sortableColumn property="carSpz" title="${message(code: 'car.spz')}" />
						<g:sortableColumn property="carType" title="${message(code: 'car.type')}" />
						<th><g:message code="car.company" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${carInstanceList}" status="i" var="carInstance">
					<tr>
						<td class="TableRowColor"><g:link action="show" id="${carInstance.id}">${fieldValue(bean: carInstance, field: "carName")}</g:link></td>
						<td class="TableRowColor">${fieldValue(bean: carInstance, field: "carInventoryCode")}</td>
						<td class="TableRowColor">${fieldValue(bean: carInstance, field: "carSpz")}</td>
						<td class="TableRowColor">${fieldValue(bean: carInstance, field: "carType")}</td>
						<td class="TableRowColor">${fieldValue(bean: carInstance, field: "company")}</td>
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${carInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
