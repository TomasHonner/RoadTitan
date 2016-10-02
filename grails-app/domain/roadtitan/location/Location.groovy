package roadtitan.location

import org.jadira.usertype.dateandtime.joda.PersistentDateTime
import org.joda.time.DateTime

class Location {

    Double latitude
    Double longitude
    DateTime timestamp
    Integer carId

    DateTime recordCreated
    DateTime lastUpdated

    static constraints = {
        latitude nullable: true
        longitude nullable: true
        timestamp nullable: true
        carId nullable: true

        recordCreated nullable: true
        lastUpdated nullable: true
    }

    static  mapping = {
        table 'location'
        latitude column: "latitude"
        longitude column: "longitude"
        carId column: "car_id"
        timestamp column: "timestamp", type: PersistentDateTime

        recordCreated type: PersistentDateTime
        lastUpdated type: PersistentDateTime
    }
}
