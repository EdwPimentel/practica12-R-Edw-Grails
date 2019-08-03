package practica12.web.grails

import grails.testing.mixin.integration.Integration
import grails.gorm.transactions.Rollback
import spock.lang.Specification
import org.hibernate.SessionFactory

@Integration
@Rollback
class DepServiceSpec extends Specification {

    DepService depService
    SessionFactory sessionFactory

    private Long setupData() {
        // TODO: Populate valid domain instances and return a valid ID
        //new Dep(...).save(flush: true, failOnError: true)
        //new Dep(...).save(flush: true, failOnError: true)
        //Dep dep = new Dep(...).save(flush: true, failOnError: true)
        //new Dep(...).save(flush: true, failOnError: true)
        //new Dep(...).save(flush: true, failOnError: true)
        assert false, "TODO: Provide a setupData() implementation for this generated test suite"
        //dep.id
    }

    void "test get"() {
        setupData()

        expect:
        depService.get(1) != null
    }

    void "test list"() {
        setupData()

        when:
        List<Dep> depList = depService.list(max: 2, offset: 2)

        then:
        depList.size() == 2
        assert false, "TODO: Verify the correct instances are returned"
    }

    void "test count"() {
        setupData()

        expect:
        depService.count() == 5
    }

    void "test delete"() {
        Long depId = setupData()

        expect:
        depService.count() == 5

        when:
        depService.delete(depId)
        sessionFactory.currentSession.flush()

        then:
        depService.count() == 4
    }

    void "test save"() {
        when:
        assert false, "TODO: Provide a valid instance to save"
        Dep dep = new Dep()
        depService.save(dep)

        then:
        dep.id != null
    }
}
