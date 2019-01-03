package practica12.web.grails

import grails.plugin.springsecurity.SpringSecurityService
import grails.plugin.springsecurity.annotation.Secured
import grails.validation.ValidationException

@Secured(['ROLE_ADMIN','ROLE_USER'])
class DepController {

    ContactoService contactoService
    DepService departamentoService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    SpringSecurityService springSecurityService

    def index(Integer max) {

        params.max = Math.min(max ?: 10, 100)

        def userAuth = springSecurityService.principal.authorities


        if(!userAuth.toString() == "[ROLE_ADMIN]"){
            respond Usuario.findById(springSecurityService.principal.id).deps.toList(), model:[departamentoCount: departamentoService.count()
            ]
            return
        }

        respond departamentoService.list(params), model:[departamentoCount: departamentoService.count()]
    }

    def show(Long id) {

        respond departamentoService.get(id)
    }

    def create() {

        respond new Dep(params)
    }

    def save(Dep departamento) {
        if (departamento == null) {
            notFound()
            return
        }



        departamento.usuario = Usuario.findById( (long) springSecurityService.principal.id)

        departamento.fecha = new Date()



        try {
            departamentoService.save(departamento)
        } catch (ValidationException e) {
            respond departamento.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'departamento.label', default: 'Dep'), departamento.nombre])
                redirect action: 'index'
            }
            '*' { respond departamento, [status: CREATED] }
        }
    }

    def edit(Long id) {


        respond departamentoService.get(id), model: ['contactoList': contactoService.list()]
    }

    def update(Dep departamento) {
        if (departamento == null) {
            notFound()
            return
        }


        departamento.usuario = Usuario.findById( (long) springSecurityService.principal.id)

        departamento.fecha = new Date()

        if(departamento.conts.size() != 0){
            for(Contacto d in contactoService.list()){

                def book = departamento.conts.find { it.id == d.id }

                if(book != null)
                    departamento.removeFromConts(book)
            }

        }

        try {
            departamentoService.save(departamento)
        } catch (ValidationException e) {
            respond departamento.errors, view:'edit'
            return
        }

        def deps = params.list('contacto')

        for(String d in deps){
            def departa =  Contacto.findById(Long.parseLong(d))
            departa.addToDeps(departamento).save(flush: true)
            departamento.addToConts(departa).save(flush: true)
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'departamento.label', default: 'Dep'), departamento.nombre])
                redirect departamento
            }
            '*'{ respond departamento, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        departamentoService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'departamento.label', default: 'Dep'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'departamento.label', default: 'Dep'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
