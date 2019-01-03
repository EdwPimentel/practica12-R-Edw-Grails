package practica12.web.grails

import grails.plugin.springsecurity.SpringSecurityService
import grails.plugin.springsecurity.annotation.Secured
import grails.validation.ValidationException

@Secured(['ROLE_ADMIN'])
class UsuarioController {

    UsuarioService usuarioService
    UsuarioRolService usuarioRolService
    DepService depService

    SpringSecurityService springSecurityService
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {

        params.max = Math.min(max ?: 10, 100)

        respond usuarioService.list(params), model:[usuarioCount: usuarioService.count(), usuarioRolList: usuarioRolService.list()]
    }

    def show(Long id) {


        respond usuarioService.get(id), model: ['usuarioRolList': usuarioRolService.list()]
    }

    def create() {

        respond new Usuario(params), model: ['depList': depService.list()]
    }

    def save(Usuario usuario) {

        if (usuario == null) {
            notFound()
            return
        }


        usuario.usuario = Usuario.findById( (long) springSecurityService.principal.id)

        usuario.fecha = new Date()


        try {
            usuarioService.save(usuario)
        } catch (ValidationException e) {
            respond usuario.errors, view:'create'
            return
        }


        if(!params.list('admin').isEmpty()){
            def r = new UsuarioRol(usuario: usuario,rol: Rol.findById(1)).save(flush: true)
        }else{
            def r = new UsuarioRol(usuario: usuario,rol: Rol.findById(2)).save(flush: true)

        }

        def deps = params.list('dep')

        for(String d in deps){
            def departa =  Dep.findById(Long.parseLong(d))
            usuario.addToDeps(departa).save(flush: true)
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'usuario.label', default: 'Usuario'), usuario.id])
                redirect usuario
            }
            '*' { respond usuario, [status: CREATED] }
        }
    }

    def edit(Long id) {


        respond usuarioService.get(id), model: [ 'departamentoList': depService.list()]
    }

    def update(Usuario usuario) {

        if (usuario == null) {
            notFound()
            return
        }


        usuario.usuario = Usuario.findById( (long) springSecurityService.principal.id)

        usuario.fecha = new Date()

        if(usuario.deps.size() != 0){
            for(Dep d in depService.list()){

                def book = usuario.deps.find { it.id == d.id }

                if(book != null)
                    usuario.removeFromDeps(book)
            }

        }

        try {
            usuarioService.save(usuario)
        } catch (ValidationException e) {
            respond usuario.errors, view:'edit'
            return
        }

        def deps = params.list('dep')

        for(String d in deps){
            def departa =  Dep.findById(Long.parseLong(d))
            usuario.addToDeps(departa).save(flush: true)
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'usuario.label', default: 'Usuario'), usuario.id])
                redirect usuario
            }
            '*'{ respond usuario, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }


        Usuario u = Usuario.findById(id)

        if(u.deps.size() != 0){
            for(Dep d in depService.list()){

                def book = u.deps.find { it.id == d.id }

                if(book != null)
                    u.removeFromDeps(book)
            }

        }



        usuarioRolService.delete(UsuarioRol.findByUsuario(u))



        usuarioService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'usuario.label', default: 'Usuario'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'usuario.label', default: 'Usuario'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
