<%@ page import="roadtitan.core.Company" %>


<div class="${hasErrors(bean: companyInstance, field: 'companyName', 'error')} list-group-item  list-group-item-success list-group-item-heading ">
	<label for="companyName">
		<g:message code="company.name" />

	</label>
	<g:textField name="companyName" value="${companyInstance?.companyName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: companyInstance, field: 'companyCode', 'error')} list-group-item ">
	<label for="companyCode">
		<g:message code="company.code" />

	</label>
	<g:textField name="companyCode" value="${companyInstance?.companyCode}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: companyInstance, field: 'companyAddress', 'error')} list-group-item ">
	<label for="companyAddress">
		<g:message code="company.address" />

	</label>
	<g:textField name="companyAddress" value="${companyInstance?.companyAddress}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: companyInstance, field: 'companyCars', 'error')} list-group-item ">
	<label for="companyCars">
		<g:message code="company.cars" />
	</label>
	
<ul>
<g:each in="${companyInstance?.companyCars?}" var="c">
    <li>${c?.encodeAsHTML()}</li>
</g:each>
<li>
<g:link controller="car" action="create" params="['company.id': companyInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'car.label', default: 'Car')])}</g:link>
</li>
</ul>


</div>

