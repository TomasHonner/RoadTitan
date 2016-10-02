package roadtitan.location

import org.jadira.usertype.dateandtime.joda.PersistentDateTime
import org.joda.time.DateTime

class LocationTwoWeeks {

    Double latitude
    Double longitude
    DateTime timestamp
    Integer carId

    static constraints = {
        latitude nullable: true
        longitude nullable: true
        timestamp nullable: true
        carId nullable: true
    }

    static mapping = {
        table 'location_two_weeks'
        latitude column: "latitude"
        longitude column: "longitude"
        carId column: "car_id"
        timestamp column: "timestamp", type: PersistentDateTime
    }
}
