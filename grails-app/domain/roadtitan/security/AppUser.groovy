package roadtitan.security

import org.jadira.usertype.dateandtime.joda.PersistentDateTime
import org.joda.time.DateTime
import roadtitan.core.Company

class AppUser {

    String appUserName
    String appUserEmail
    String appUserAddress
    static belongsTo = [company: Company, secUser: SecUser]

    DateTime dateCreated
    DateTime lastUpdated

    static constraints = {
        appUserName nullable: false
        appUserEmail nullable: false, email: true
        appUserAddress nullable: true
        company nullable: true

        dateCreated nullable: true, type: PersistentDateTime
        lastUpdated nullable: true, type: PersistentDateTime
    }

    static mapping = {
        table 'app_user'
        appUserAddress column: "app_user_name"
        appUserEmail column: "app_user_email"
        appUserAddress column: "app_user_address"
        company column: "company"
        secUser column: "sec_user"
    }

    @Override
    String toString() {
        return appUserName
    }
}
