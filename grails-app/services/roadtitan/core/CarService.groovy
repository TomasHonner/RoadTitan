package roadtitan.core

import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional

@Secured(["ROLE_ADMIN","ROLE_SUPERVISOR","ROLE_USER"])
@Transactional
class CarService {

    def companyService

    def serviceMethod() {

    }

    def listOfCars()
    {
        return [cars: Car.findAllByCompany(companyService.currentCompany())]
    }

    def findCarByName(String carName)
    {
        return Car.findByCarName(carName).carId
    }
}
