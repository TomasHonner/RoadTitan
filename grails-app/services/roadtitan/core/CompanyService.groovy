package roadtitan.core

import grails.transaction.Transactional
import roadtitan.security.AppUser
import roadtitan.security.SecUser

@Transactional
class CompanyService {

    def springSecurityService

    def serviceMethod() {

    }

    def currentCompany()
    {
        def secUser = (SecUser) springSecurityService.currentUser
        def appUser = AppUser.findBySecUser(secUser)

        return appUser.company
    }
}
