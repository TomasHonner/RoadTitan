<%@ page import="roadtitan.core.Car" %>


<div class="fieldcontain ${hasErrors(bean: carInstance, field: 'carName', 'error')} list-group-item  list-group-item-success list-group-item-heading  ">
	<label for="carName">
		<g:message code="car.name" />
		
	</label>
	<g:textField name="carName" value="${carInstance?.carName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: carInstance, field: 'carInventoryCode', 'error')} list-group-item">
	<label for="carInventoryCode">
		<g:message code="car.inventoryCode" />
		
	</label>
	<g:textField name="carInventoryCode" value="${carInstance?.carInventoryCode}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: carInstance, field: 'carSpz', 'error')} list-group-item">
	<label for="carSpz">
		<g:message code="car.spz" />
		
	</label>
	<g:textField name="carSpz" value="${carInstance?.carSpz}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: carInstance, field: 'carType', 'error')} list-group-item">
	<label for="carType">
		<g:message code="car.type" />
		
	</label>
	<g:select id="carType" name="carType" from="${enums.CarType?.values()}" keys="${enums.CarType.values()*.name()}" value="${carInstance?.carType?.name()}"  noSelection="['': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: carInstance, field: 'company', 'error')} list-group-item">
	<label for="company">
		<g:message code="car.company" />
		
	</label>
	<g:select id="company" name="company.id" from="${roadtitan.core.Company.list()}" optionKey="id" value="${carInstance?.company?.id}" noSelection="['null': '']"/>

</div>

