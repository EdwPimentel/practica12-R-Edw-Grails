package practica12.web.grails

import grails.plugin.springsecurity.SpringSecurityService
import grails.plugin.springsecurity.annotation.Secured
import grails.validation.ValidationException

@Secured(['ROLE_ADMIN','ROLE_USER'])
class ContactoController {

    ContactoService contactoService
    CategoriaService categoriaService
    DepService departamentoService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    SpringSecurityService springSecurityService

    def index(Integer max) {

        params.max = Math.min(max ?: 10, 100)
        respond contactoService.list(params), model:[contactoCount: contactoService.count()]
    }

    def show(Long id) {

        respond contactoService.get(id)
    }

    def create() {

        respond new Contacto(params),model: ['categoriaList': categoriaService.list(),'departamentoList': departamentoService.list()]
    }

    def save(Contacto contacto) {
        if (contacto == null) {
            notFound()
            return
        }

        contacto.usuario = Usuario.findById( (long) springSecurityService.principal.id)

        contacto.fecha = new Date()



        try {
            contactoService.save(contacto)
        } catch (ValidationException e) {
            respond contacto.errors, view:'create', model: ['categoriaList': categoriaService.list(),'departamentoList': departamentoService.list()]
            return
        }

        def deps = params.list('dep')
        for(String d in deps){
            def departa =  Dep.findById(Long.parseLong(d))
            departa.addToConts(contacto).save(flush: true)
            contacto.addToDeps(departa).save(flush: true)
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'contacto.label', default: 'Contacto'), contacto.nombre])
                redirect action: "index"
            }
            '*' { respond contacto, [status: CREATED] }
        }
    }

    def edit(Long id) {


        respond contactoService.get(id), model: ['categoriaList': categoriaService.list(),'departamentoList': departamentoService.list()]
    }

    def update(Contacto contacto) {

        if (contacto == null) {
            notFound()
            return
        }


        contacto.usuario = Usuario.findById( (long) springSecurityService.principal.id)

        contacto.fecha = new Date()

        if(contacto.deps.size() != 0){
            for(Dep d in departamentoService.list()){

                def book = contacto.deps.find { it.id == d.id }

                if(book != null)
                contacto.removeFromDeps(book)
            }

        }


        try {
            contactoService.save(contacto)
        } catch (ValidationException e) {
            respond contacto.errors, view:'edit'
        }

        def deps = params.list('dep')

        for(String d in deps){
            def departa =  Dep.findById(Long.parseLong(d))
            departa.addToConts(contacto).save(flush: true)
            contacto.addToDeps(departa).save(flush: true)
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'contacto.label', default: 'Contacto'), contacto.nombre])
                redirect contacto
            }
            '*'{ respond contacto, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        def contacto = Contacto.findById(id)

        if(contacto.deps.size() != 0){
            for(Dep d in departamentoService.list()){

                def book = contacto.deps.find { it.id == d.id }

                if(book != null)
                    contacto.removeFromDeps(book)
            }

        }

        contactoService.delete(id)


        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'contacto.label', default: 'Contacto'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'contacto.label', default: 'Contacto'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
