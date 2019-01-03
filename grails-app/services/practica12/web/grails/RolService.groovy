package practica12.web.grails

import grails.gorm.services.Service

@Service(Rol)
interface RolService {

    Rol get(Serializable id)

    List<Rol> list(Map args)

    Long count()

    void delete(Serializable id)

    Rol save(Rol role)

}