import enums.CarType
import roadtitan.core.Car
import roadtitan.core.Company
import roadtitan.security.*

class BootStrap {

    def init = { servletContext ->


        if (!AppUser.count) {
            // Define of Security roles
            def userRole = SecRole.findByAuthority('ROLE_USER') ?: new SecRole(authority: 'ROLE_USER').save(failOnError: true)
            def adminRole = SecRole.findByAuthority('ROLE_ADMIN') ?: new SecRole(authority: 'ROLE_ADMIN').save(failOnError: true)
            def supervisorRole = SecRole.findByAuthority('ROLE_SUPERVISOR') ?: new SecRole(authority: 'ROLE_SUPERVISOR').save(failOnError: true)

            // User with admin privileges
            def adminUser = AppUser.findByAppUserName('ADMIN') ?: new AppUser(
                    appUserName: 'ADMIN',
                    appUserEmail: 'admin@admin.com',
                    appUserAddress: 'Silicon Valley',
                    secUser: new SecUser(
                            realName: 'Tomas Honner',
                            username: 'admin',
                            password: 'admin',
                            enabled: true).save(failOnError: true),
                    company: new Company(companyName: "ADMIN COMPANY").save(failOnError: true)
            ).save(failOnError: true)

            if (!adminUser.secUser.authorities.contains(adminRole)) {
                SecUserSecRole.create adminUser.secUser, adminRole
            }

            def supervisorUser = AppUser.findByAppUserName('SUPERVISOR') ?: new AppUser(
                    appUserName: 'SUPERVISOR',
                    appUserEmail: 'supervisor@supervisor.com',
                    appUserAddress: 'Olymp',
                    secUser: new SecUser(
                            realName: 'Tomas Honner',
                            username: 'supervisor',
                            password: 'supervisor',
                            enabled: true).save(failOnError: true),
                    company: new Company(companyName: "SUPERVISOR COMPANY").save(failOnError: true)
            ).save(failOnError: true)

            if (!supervisorUser.secUser.authorities.contains(supervisorRole)) {
                SecUserSecRole.create supervisorUser.secUser, supervisorRole
            }

            def userUser = AppUser.findByAppUserName('USER') ?: new AppUser(
                    appUserName: 'USER',
                    appUserEmail: 'user@user.com',
                    appUserAddress: 'Olymp',
                    secUser: new SecUser(
                            realName: 'Tomas Honner',
                            username: 'user',
                            password: 'user',
                            enabled: true).save(failOnError: true),
                    company: new Company(companyName: "USER COMPANY").save(failOnError: true)
            ).save(failOnError: true)

            if (!userUser.secUser.authorities.contains(userRole)) {
                SecUserSecRole.create userUser.secUser, userRole
            }
        }


        if (!Car.count)
        {
            Company company1 = new Company(companyId: 1, companyCode: 1, companyName: "Toms Company", companyAddress: "Hradce 37001 České budějovice").save(failOnError: true)
            Company company2 = new Company(companyId: 2, companyCode: 2, companyName: "Ondras Company", companyAddress: "Hrdějovice 37005 České Budějovice").save(failOnError: true)
            Company company3 = new Company(companyId: 3, companyCode: 3, companyName: "Bobs Company", companyAddress: "Silicon Valley LA CA").save(failOnError: true)

            Car car1 = new Car(carId: 1, carName: "Škoda Yeti", carInventoryCode: "1", carSpz: '123', carType: CarType.PERSONAL, company: company1).save(failOnError: true)
            Car car2 = new Car(carId: 2, carName: "Škoda Superb", carInventoryCode: "2", carSpz: '234', carType: CarType.PERSONAL, company: company2).save(failOnError: true)
            Car car3 = new Car(carId: 3, carName: "VW Transporter", carInventoryCode: "3", carSpz: '345', carType: CarType.CARGO, company: company3).save(failOnError: true)
            Car car4 = new Car(carId: 4, carName: "VW Transporter", carInventoryCode: "4", carSpz: '456', carType: CarType.CARGO, company: company1).save(failOnError: true)
            Car car5 = new Car(carId: 5, carName: "Mercedes Acros", carInventoryCode: "5", carSpz: '567', carType: CarType.TIR, company: company2).save(failOnError: true)

        }

        if (!AppUser.findByAppUserName('tom'))
        {
            def tomUser = AppUser.findByAppUserName('tom') ?: new AppUser(
                    appUserName: 'tom',
                    appUserEmail: 'tom@tom.com',
                    appUserAddress: 'Olymp',
                    secUser: new SecUser(
                            realName: 'Tomas Honner',
                            username: 'tom',
                            password: 'tom',
                            enabled: true).save(failOnError: true),
                    company: Company.findAllByCompanyId(1)
            ).save(failOnError: true)

            def supervisorRole = SecRole.findByAuthority("ROLE_SUPERVISOR")

            if (!tomUser.secUser.authorities.contains(supervisorRole)) {
                SecUserSecRole.create tomUser.secUser, supervisorRole
            }
        }

        if (!AppUser.findByAppUserName('ondra'))
        {
            def ondraUser = AppUser.findByAppUserName('ondra') ?: new AppUser(
                    appUserName: 'ondra',
                    appUserEmail: 'ondra@ondra.com',
                    appUserAddress: 'Olymp',
                    secUser: new SecUser(
                            realName: 'Ondra',
                            username: 'ondra',
                            password: 'ondra',
                            enabled: true).save(failOnError: true),
                    company: Company.findAllByCompanyId(2)
            ).save(failOnError: true)

            def userRole = SecRole.findByAuthority("ROLE_USER")

            if (!ondraUser.secUser.authorities.contains(userRole)) {
                SecUserSecRole.create ondraUser.secUser, userRole
            }
        }

    }

    def destroy = {
    }
}
