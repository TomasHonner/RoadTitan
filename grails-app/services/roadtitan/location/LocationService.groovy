package roadtitan.location

import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional
import org.joda.time.DateTime

@Secured(["ROLE_ADMIN","ROLE_SUPERVISOR","ROLE_USER"])
@Transactional(readOnly = true)
class LocationService {

    def sessionFactory

    def serviceMethod() {

    }

    def allLocations()
    {
        return Location.list()
    }

    def findLocationsByCar(int carId)
    {
        return Location.findAllByCarId(carId)
    }

    def findLocationsByDate(int carId, String dateFrom, String dateTo)
    {
        final session = sessionFactory.currentSession

        final String query = "SELECT * FROM location as l WHERE car_id = "+carId.toString()+" AND l.timestamp >= '"+dateFrom+"' AND l.timestamp <= '"+dateTo+"';"
        final sqlQuery = session.createSQLQuery(query)

        final results = sqlQuery.with {
            addEntity(Location)
            list()
        }

        return results
    }

}
