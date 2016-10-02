package roadtitan.map

import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional
import org.joda.time.DateTime


@Secured(["ROLE_ADMIN","ROLE_SUPERVISOR","ROLE_USER"])
@Transactional
class MapService {

    def carService

    def locationDayService
    def locationMonthService
    def locationThreeDaysService
    def locationTwoWeeksService
    def locationWeekService
    def locationService

    def serviceMethod() {

    }

    def listOfCurrentCars()
    {
        carService.listOfCars()
    }

    def filteredLocations(int carId)
    {
        return locationService.findLocationsByCar(carId)
    }

    def filteredLocationsDay(int carId)
    {
        return locationDayService.findLocationsByCar(carId)
    }

    def filteredLocationsThreeDays(int carId)
    {
        return locationThreeDaysService.findLocationsByCar(carId)
    }

    def filteredLocationsWeek(int carId)
    {
        return locationWeekService.findLocationsByCar(carId)
    }

    def filteredLocationsTwoWeeks(int carId)
    {
        return locationTwoWeeksService.findLocationsByCar(carId)
    }

    def filteredLocationsMonth(int carId)
    {
        return locationMonthService.findLocationsByCar(carId)
    }

    def filteredLocationsByDate(int carId, String dateFrom, String dateTo)
    {
        return locationService.findLocationsByDate(carId, dateFrom, dateTo)
    }
}
