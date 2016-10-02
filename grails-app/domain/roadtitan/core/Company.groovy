package roadtitan.core

import org.jadira.usertype.dateandtime.joda.PersistentDateTime
import org.joda.time.DateTime

class Company {

    Long companyId
    String companyName
    String companyCode
    String companyAddress
    static hasMany = [companyCars: Car]

    DateTime dateCreated
    DateTime lastUpdated

    static constraints = {
        companyId nullable: true, unique: true
        companyName nullable: true
        companyCode nullable: true
        companyAddress nullable: true
        companyCars nullable: true

        dateCreated nullable: true
        lastUpdated nullable: true
    }

    static mapping = {
        table 'companies'
        companyId column: "company_id"
        companyName column: "company_name"
        companyCode column: "company_code"
        companyAddress column: "company_address"

        dateCreated type: PersistentDateTime
        lastUpdated type: PersistentDateTime
    }

    @Override
    String toString() {
        return companyName
    }
}
