package roadtitan.location

import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional
import roadtitan.core.Car

@Secured(["ROLE_ADMIN","ROLE_SUPERVISOR","ROLE_USER"])
@Transactional(readOnly = true)
class LocationTwoWeeksService {

    def serviceMethod() {

    }

    def allLocations()
    {
        return LocationTwoWeeks.list()
    }

    def findLocationsByCar(int carId)
    {
        return LocationTwoWeeks.findAllByCarId(carId)
    }
}
