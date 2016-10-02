<%@ page import="roadtitan.reservation.Reservation" %>

<div class="fieldcontain ${hasErrors(bean: reservationInstance, field: 'reservationCode', 'error')} list-group-item  list-group-item-success list-group-item-heading  ">
	<label for="reservationCode">
		<g:message code="reservation.code" />
	</label>
	<g:textField name="reservationCode" value="${reservationInstance?.reservationCode}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: reservationInstance, field: 'reservationName', 'error')} list-group-item ">
	<label for="reservationName">
		<g:message code="reservation.name" />
	</label>
	<g:textField name="reservationName" value="${reservationInstance?.reservationName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: reservationInstance, field: 'reservationDescription', 'error')} list-group-item">
	<label for="reservationDescription">
		<g:message code="reservation.description" />
	</label>
	<g:textField name="reservationDescription" value="${reservationInstance?.reservationDescription}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: reservationInstance, field: 'reservationFrom', 'error')} list-group-item">
	<label for="reservationFrom">
		<g:message code="reservation.from" />
	</label>
	<joda:dateTimePicker name="reservationFrom" value="${new org.joda.time.DateTime()}" precision="hour" years="${2016..2040}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: reservationInstance, field: 'reservationTo', 'error')} list-group-item">
	<label for="reservationTo">
		<g:message code="reservation.to" />
	</label>
	<joda:dateTimePicker name="reservationTo" value="${new org.joda.time.DateTime()}" precision="hour" years="${2016..2040}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: reservationInstance, field: 'car', 'error')} required list-group-item">
	<label for="car">
		<g:message code="reservation.car" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="car" name="car.id" from="${roadtitan.core.Car.list()}" optionKey="id" required="" value="${reservationInstance?.car?.id}" class="many-to-one"/>
</div>


<div class="fieldcontain ${hasErrors(bean: reservationInstance, field: 'user', 'error')} required list-group-item">
	<label for="user">
		<g:message code="reservation.user" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="user" name="user.id" from="${roadtitan.security.User.list()}" optionKey="id" required="" value="${reservationInstance?.user?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: reservationInstance, field: 'reservationAproved', 'error')} list-group-item">
	<label for="reservationAproved">
		<g:message code="reservation.aproved" />
	</label>
	<g:checkBox name="reservationAproved" value="${reservationInstance?.reservationAproved}" />
</div>
