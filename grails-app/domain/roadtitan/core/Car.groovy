package roadtitan.core

import enums.CarType
import org.jadira.usertype.dateandtime.joda.PersistentDateTime
import org.joda.time.DateTime

class Car {

    Integer carId
    String carName
    String carInventoryCode
    String carSpz
    CarType carType
    static belongsTo = [company: Company]

    DateTime dateCreated
    DateTime lastUpdated

    static constraints = {
        carId nullable: true, unique: true
        carName nullable: true
        carInventoryCode nullable: true
        carSpz nullable: true, unique: true
        carType nullable: true
        company nullable: true

        dateCreated nullable: true
        dateCreated nullable: true
    }

    static mapping = {
        table 'cars'
        carId column: "car_id"
        carName column: "car_name"
        carInventoryCode column: "car_inventory_code"
        carSpz column: "car_spz"
        carType column: "car_type"

        dateCreated type: PersistentDateTime
        lastUpdated type: PersistentDateTime
    }

    @Override
    String toString() {
        return carName
    }
}
