<%@ page import="org.joda.time.LocalDate" %>
<div class="row">
    <div id="filter">
        <div class="row">
            <label><g:message code="car.title2"/></label>
            <g:select id="cars" name="cars" from="${cars}" value="car.name" optionKey="carId" />
        </div>
        <div class="row">
            <div>
                <label><g:message code="filter.time.select.interval"/></label>
                <input id="radioSelect1" name="radioSelect" type="radio" value="time" checked/>
                <span id="selectTime">
                    <label><g:message code="filter.time.title"/> </label>
                    <select id="timeInterval" name="timeInterval">
                        <option value="1"><g:message code="filter.time.day" /></option>
                        <option value="2"><g:message code="filter.time.threeDays" /></option>
                        <option value="3"><g:message code="filter.time.week" /></option>
                        <option value="4"><g:message code="filter.time.twoWeeks" /></option>
                        <option value="5"><g:message code="filter.time.month" /></option>
                        <option value="6"><g:message code="filter.time.eternity" /></option>
                    </select>
                </span>
                <span id="selectDate">
                    <label><g:message code="filter.time.select.date"/></label>
                    <input id="radioSelect2" name="radioSelect" type="radio" value="date"/>
                    <label><g:message code="filter.time.date.from"/></label>
                    <joda:datePicker name="dateFrom" value="${new LocalDate()}" years="${2010..2030}"/>
                    <label><g:message code="filter.time.date.to"/></label>
                    <joda:datePicker name="dateTo" value="${new LocalDate()}" years="${2010..2030}"/>
                </span>
            </div>
        </div>
        <button class="btn btn-sm btn-danger" id="btest" onclick="filterClick()">test</button>
    </div>

</div>