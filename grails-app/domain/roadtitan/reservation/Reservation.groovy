package roadtitan.reservation

import org.jadira.usertype.dateandtime.joda.PersistentDateTime
import org.joda.time.DateTime
import roadtitan.core.Car
import roadtitan.security.AppUser

class Reservation {

    Long reservationId
    String reservationCode
    String reservationName
    String reservationDescription
    DateTime reservationFrom
    DateTime reservationTo
    boolean reservationAproved
    static belongsTo = [user: AppUser, car: Car]

    DateTime dateCreated
    DateTime lastUpdated

    static constraints = {
        reservationId nullable: true, unique: true
        reservationCode nullable: true
        reservationName nullable: true
        reservationDescription nullable: true
        reservationFrom nullable: true
        reservationTo nullable: true

        dateCreated nullable: true
        lastUpdated nullable: true
    }

    static mapping = {
        table 'reservations'
        reservationId column: "reservation_id"
        reservationCode column: "reservation_code"
        reservationName column: "reservation_name"
        reservationDescription column: "reservation_description"
        reservationFrom column: "reservation_from", type: PersistentDateTime
        reservationTo column: "reservation_to", type: PersistentDateTime
        reservationAproved column: "reservation_aproved"

        dateCreated type: PersistentDateTime
        lastUpdated type: PersistentDateTime
    }
}
