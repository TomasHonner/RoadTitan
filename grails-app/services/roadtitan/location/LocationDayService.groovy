package roadtitan.location

import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional
import roadtitan.core.Car

@Secured(["ROLE_ADMIN","ROLE_SUPERVISOR","ROLE_USER"])
@Transactional(readOnly = true)
class LocationDayService {

    def serviceMethod() {

    }

    def allLocations()
    {
        return LocationDay.list()
    }

    def findLocationsByCar(Long carId)
    {
        return LocationDay.findAllByCarId(carId)
    }
}
