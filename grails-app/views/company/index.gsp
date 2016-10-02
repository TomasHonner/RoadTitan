
<%@ page import="roadtitan.core.Company" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<title><g:message code="company.title"/></title>
	</head>
	<body>
		<div class="nav" role="navigation">
			<ul class="nav nav-tabs">
				<sec:ifAnyGranted roles="ROLE_ADMIN">
				<li><g:link class="create" action="create"><g:message code="company.new" /></g:link></li>
				</sec:ifAnyGranted>
			</ul>
		</div>
		<div id="list-company">
			<h1><g:message code="company.title" /></h1>
			<g:if test="${flash.message}">
				<div>${flash.message}</div>
			</g:if>
			<table class="table table-striped">
			<thead class="TableHeadingColor">
					<tr>
						<g:sortableColumn property="companyName" title="${message(code: 'company.name', default: 'Company Name')}" />
						<g:sortableColumn property="companyCode" title="${message(code: 'company.code', default: 'Company Code')}" />
						<g:sortableColumn property="companyAddress" title="${message(code: 'company.address', default: 'Company Address')}" />
						<th><g:message code="company.cars"/></th>
					</tr>
				</thead>
				<tbody>
				<g:each in="${companyInstanceList}" status="i" var="companyInstance">
					<tr>
						<td><g:link action="show" id="${companyInstance.id}">${fieldValue(bean: companyInstance, field: "companyName")}</g:link></td>
						<td>${fieldValue(bean: companyInstance, field: "companyCode")}</td>
						<td>${fieldValue(bean: companyInstance, field: "companyAddress")}</td>
						<td>${fieldValue(bean: companyInstance, field: "companyCars")}</td>
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${companyInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
