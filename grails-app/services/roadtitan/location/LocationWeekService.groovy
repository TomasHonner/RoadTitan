package roadtitan.location

import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional
import roadtitan.core.Car

@Secured(["ROLE_ADMIN","ROLE_SUPERVISOR","ROLE_USER"])
@Transactional(readOnly = true)
class LocationWeekService {

    def serviceMethod() {

    }

    def allLocations()
    {
        return LocationWeek.list()
    }

    def findLocationsByCar(int carId)
    {
        return LocationWeek.findAllByCarId(carId)
    }
}
