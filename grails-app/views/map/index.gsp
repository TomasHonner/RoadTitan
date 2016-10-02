<%--
  Created by IntelliJ IDEA.
  User: tom
  Date: 23.9.16
  Time: 9:26
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title><g:message code="map.title"/></title>

    %{--<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAgNFK7Z0k60ySZCHnG3J22vTIbEK-SJOg&callback=initializeMap"></script>--}%

    <g:javascript library="jquery" />
    <g:javascript library="prototype" />
    <script src="https://maps.google.com/maps/api/js?sensor=false&libraries=geometry&v=3.22&key=AIzaSyAgNFK7Z0k60ySZCHnG3J22vTIbEK-SJOg"></script>
    <g:javascript>
            var loc = [];
            var maplace;

            function filterClick() {
                var val = $('input[name=radioSelect]:checked', '#filter').val();
                if(val == "time"){
                    getTimeInterval();
                }
                if (val == "date"){
                    getDateInterval(buildDateFrom(), buildDateTo());
                }
            }

            function getTimeInterval() {
                $.ajax({
                    url:"${g.createLink(controller:'map',action: 'filteredLocationsTime')}",
                    dataType: 'json',
                    data: {
                        carId: $("#cars").val(),
                        timeInterval: $("#timeInterval").val()
                    },
                    success: function(data) {
                        loc.length = 0;
                        for(var i = 0 ; i < data.length; i++)
                        {
                            var location = {
                                lat: data[i].latitude,
                                lon: data[i].longitude,
                                title: "carId: "+data[i].carId,
                                html: "carId: "+data[i].carId+" <br> "+data[i].timestamp
                            }

                            loc.push(location);
                        }
                        // alert(JSON.stringify(loc));
                        maplace.SetLocations(loc, true);

                    },
                    error: function(request, status, error) {
                        alert(error)
                    },
                    complete: function() {
                    }
                });
            }

            function getDateInterval(dateFrom,dateTo) {
              $.ajax({
                    url:"${g.createLink(controller:'map',action: 'filteredLocationsDate')}",
                    //url: url,
                    dataType: 'json',
                    data: {
                        carId: $("#cars").val(),
                        dateFrom: dateFrom,
                        dateTo: dateTo
                    },
                    success: function(data) {
                        loc.length = 0;
                        for(var i = 0 ; i < data.length; i++)
                        {
                            var location = {
                                lat: data[i].latitude,
                                lon: data[i].longitude,
                                title: "carId: "+data[i].carId,
                                html:  "carId: "+data[i].carId+" <br> "+data[i].timestamp
                            }

                            loc.push(location);
                        }
                        // alert(JSON.stringify(loc));
                        maplace.SetLocations(loc, true);

                    },
                    error: function(request, status, error) {
                        alert(error)
                    },
                    complete: function() {
                    }
                });
            }

            function buildDateFrom() {
              var dateFromBuilder = "";
                dateFromBuilder += $("#dateFrom_year").val();
                dateFromBuilder +="-";
                dateFromBuilder += $("#dateFrom_month").val();
                dateFromBuilder += "-";
                dateFromBuilder += $("#dateFrom_day").val();
               return dateFromBuilder
            }

            function buildDateTo() {
              var dateFromBuilder = "";
                dateFromBuilder += $("#dateTo_year").val();
                dateFromBuilder +="-";
                dateFromBuilder += $("#dateTo_month").val();
                dateFromBuilder += "-";
                dateFromBuilder += $("#dateTo_day").val();
               return dateFromBuilder
            }

            $(function() {
                function init() {
                           $("#dateFrom_day, #dateFrom_month, #dateFrom_year").prop('disabled', true);
                           $("#dateTo_day, #dateTo_month, #dateTo_year").prop('disabled', true);
                }
            })

            $(function () {
                maplace = new Maplace({
                    map_options: {
                        set_center: [48.977974, 14.446534],
                        zoom: 7
                    }
                }).Load();
            });

            $(function() {
                $("#filter").change(function() {
                    var val = $('input[name=radioSelect]:checked', '#filter').val();
                    if (val == "date")
                        {
                           $("#timeInterval").prop('disabled', true);
                           $("#dateFrom_day, #dateFrom_month, #dateFrom_year").prop('disabled', false);
                           $("#dateTo_day, #dateTo_month, #dateTo_year").prop('disabled', false);
                        }
                    else
                        {
                           $("#timeInterval").prop('disabled', false)
                           $("#dateFrom_day, #dateFrom_month, #dateFrom_year").prop('disabled', true);
                           $("#dateTo_day, #dateTo_month, #dateTo_year").prop('disabled', true);
                        }
                })
            })
    </g:javascript>
</head>

<body>
<g:render template="form"/>
<div class="row">
    <div id="gmap" class="map">

    </div>
</div>
</body>
</html>