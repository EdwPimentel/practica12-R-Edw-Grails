package practica12.web.grails

import grails.plugin.springsecurity.SpringSecurityService
import grails.plugin.springsecurity.annotation.Secured
import grails.validation.ValidationException

@Secured(['ROLE_ADMIN','ROLE_USER'])
class DepController {

    ContactoService contactoService
    DepService depService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    SpringSecurityService springSecurityService

    def index(Integer max) {

        params.max = Math.min(max ?: 10, 100)

        def userAuth = springSecurityService.principal.authorities


        if(!userAuth.toString() == "[ROLE_ADMIN]"){
            respond Usuario.findById(springSecurityService.principal.id).deps.toList(), model:[depCount: depService.count()
            ]
            return
        }

        println(depService.list(params))
        respond depService.list(params), model:[depCount: depService.count()]
    }

    def show(Long id) {

        respond depService.get(id)
    }

    def create() {

        respond new Dep(params)
    }

    def save(Dep dep) {
        if (dep == null) {
            notFound()
            return
        }



        dep.usuario = Usuario.findById( (long) springSecurityService.principal.id)

        dep.fecha = new Date()



        try {
            depService.save(dep)
        } catch (ValidationException e) {
            respond dep.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'dep.label', default: 'Dep'), dep.nombre])
                redirect action: 'index'
            }
            '*' { respond dep, [status: CREATED] }
        }
    }

    def edit(Long id) {


        respond depService.get(id), model: ['contactoList': contactoService.list()]
    }

    def update(Dep dep) {
        if (dep == null) {
            notFound()
            return
        }


        dep.usuario = Usuario.findById( (long) springSecurityService.principal.id)

        dep.fecha = new Date()

        if(dep.conts.size() != 0){
            for(Contacto d in contactoService.list()){

                def book = dep.conts.find { it.id == d.id }

                if(book != null)
                    dep.removeFromConts(book)
            }

        }

        try {
            depService.save(dep)
        } catch (ValidationException e) {
            respond dep.errors, view:'edit'
            return
        }

        def deps = params.list('contacto')

        for(String d in deps){
            def departa =  Contacto.findById(Long.parseLong(d))
            departa.addToDeps(dep).save(flush: true)
            dep.addToConts(departa).save(flush: true)
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'dep.label', default: 'Dep'), dep.nombre])
                redirect dep
            }
            '*'{ respond dep, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        depService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'dep.label', default: 'Dep'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'dep.label', default: 'Dep'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
