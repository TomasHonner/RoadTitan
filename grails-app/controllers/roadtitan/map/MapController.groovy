package roadtitan.map

import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured
import org.joda.time.DateTime
import org.joda.time.LocalDate

@Secured(["ROLE_ADMIN","ROLE_SUPERVISOR","ROLE_USER"])
class MapController {

    def mapService
    def carService


    def index() {

        def cars = mapService.listOfCurrentCars()
    }

    def filteredLocationsTime()
    {
        String carId = params.carId
        String timeInterval = params.timeInterval
        int ci = Integer.parseInt(carId)
        int ti = Integer.parseInt(timeInterval)

        switch (ti)
        {
            case 1 : render mapService.filteredLocationsDay(ci) as JSON; break;
            case 2 : render mapService.filteredLocationsThreeDays(ci) as JSON; break;
            case 3 : render mapService.filteredLocationsWeek(ci) as JSON; break;
            case 4 : render mapService.filteredLocationsTwoWeeks(ci) as JSON; break;
            case 5 : render mapService.filteredLocationsMonth(ci) as JSON; break;
            case 6 : render mapService.filteredLocations(ci) as JSON; break;
        }
    }

    def filteredLocationsDate()
    {
        String carId = params.carId
        String dateFromString = params.dateFrom
        String dateToString = params.dateTo
        String dateFrom =new DateTime(new  LocalDate(dateFromString).toDateTimeAtCurrentTime()).toString()
        String dateTo = new DateTime(new  LocalDate(dateToString).toDateTimeAtCurrentTime()).toString()

        int ci = Integer.parseInt(carId)
        render mapService.filteredLocationsByDate(ci, dateFrom, dateTo) as JSON

    }

    /*def filteredLocationsDay()
    {
        String carId = params.carId
        int ci = Integer.parseInt(carId)
        render mapService.filteredLocationsDay(ci) as JSON
    }

    def filteredLocationsThreeDays()
    {
        String carId = params.carId
        int ci = Integer.parseInt(carId)
        render mapService.filteredLocationsThreeDays(ci) as JSON
    }

    def filteredLocationsWeek()
    {
        String carId = params.carId
        int ci = Integer.parseInt(carId)
        render mapService.filteredLocationsWeek(ci) as JSON
    }

    def filteredLocationsTwoWeeks()
    {
        String carId = params.carId
        int ci = Integer.parseInt(carId)
        render mapService.filteredLocationsTwoWeeks(ci) as JSON
    }

    def filteredLocationsMonth()
    {
        String carId = params.carId
        int ci = Integer.parseInt(carId)
        render mapService.filteredLocationsMonth(ci) as JSON
    }*/
}
