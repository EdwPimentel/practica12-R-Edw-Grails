package practica12.web.grails

import grails.gorm.services.Service

@Service(Dep)
interface DepService {

    Dep get(Serializable id)

    List<Dep> list(Map args)

    Long count()

    void delete(Serializable id)

    Dep save(Dep dep)

}