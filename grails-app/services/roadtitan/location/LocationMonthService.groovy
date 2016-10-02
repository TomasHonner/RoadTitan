package roadtitan.location

import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional
import roadtitan.core.Car

@Secured(["ROLE_ADMIN","ROLE_SUPERVISOR","ROLE_USER"])
@Transactional(readOnly = true)
class LocationMonthService {

    def serviceMethod() {

    }

    def allLocations()
    {
        return LocationMonth.list()
    }

    def findLocationsByCar(int carId)
    {
        return LocationMonth.findAllByCarId(carId)
    }
}
