
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
				<li><g:link class="create" action="create"><g:message code="user.new" /></g:link></li>
			</ul>
		</div>
		<div>
			<h1><g:message code="user.title" /></h1>
			<g:if test="${flash.message}">
				<div>${flash.message}</div>
			</g:if>
			<table class="table table-striped">
			<thead class="TableHeadingColor">
					<tr>
						<g:sortableColumn property="appUserName" title="${message(code: 'user.name')}" />
						<g:sortableColumn property="appUserEmail" title="${message(code: 'user.email')}" />
						<g:sortableColumn property="appUserAddress" title="${message(code: 'user.address')}" />
						<th><g:message code="company.title2" /></th>
					</tr>
				</thead>
				<tbody>
				<g:each in="${appUserInstanceList}" status="i" var="appUserInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${appUserInstance.id}">${fieldValue(bean: appUserInstance, field: "appUserName")}</g:link></td>
					
						<td>${fieldValue(bean: appUserInstance, field: "appUserEmail")}</td>
					
						<td>${fieldValue(bean: appUserInstance, field: "appUserAddress")}</td>
					
						<td>${fieldValue(bean: appUserInstance, field: "company")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${appUserInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
