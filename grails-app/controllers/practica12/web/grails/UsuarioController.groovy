package practica12.web.grails

import grails.plugin.springsecurity.SpringSecurityService
import grails.plugin.springsecurity.annotation.Secured
import grails.validation.ValidationException

@Secured(['ROLE_ADMIN'])
class UsuarioController {

    UsuarioService userService
    UsuarioRolService userRoleService
    DepService departamentoService
    RolService roleService

    SpringSecurityService springSecurityService
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {

        params.max = Math.min(max ?: 10, 100)

        respond userService.list(params), model:[userCount: userService.count(), userRoleList: userRoleService.list()]
    }

    def show(Long id) {


        respond userService.get(id), model: ['userRoleList': userRoleService.list()]
    }

    def create() {

        respond new Usuario(params), model: ['departamentoList': departamentoService.list()]
    }

    def save(Usuario user) {

        if (user == null) {
            notFound()
            return
        }


        user.usuario = Usuario.findById( (long) springSecurityService.principal.id)

        user.fecha = new Date()


        try {
            userService.save(user)
        } catch (ValidationException e) {
            respond user.errors, view:'create'
            return
        }


        if(!params.list('admin').isEmpty()){
            def r = new UsuarioRol(user: user,role: Rol.findById(1)).save(flush: true)
        }else{
            def r = new UsuarioRol(user: user,role: Rol.findById(2)).save(flush: true)

        }

        def deps = params.list('dep')

        for(String d in deps){
            def departa =  Dep.findById(Long.parseLong(d))
            user.addToDeps(departa).save(flush: true)
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'usuario.label', default: 'Usuario'), user.id])
                redirect user
            }
            '*' { respond user, [status: CREATED] }
        }
    }

    def edit(Long id) {


        respond userService.get(id), model: [ 'departamentoList': departamentoService.list()]
    }

    def update(Usuario user) {

        if (user == null) {
            notFound()
            return
        }


        user.usuario = Usuario.findById( (long) springSecurityService.principal.id)

        user.fecha = new Date()

        if(user.deps.size() != 0){
            for(Dep d in departamentoService.list()){

                def book = user.deps.find { it.id == d.id }

                if(book != null)
                    user.removeFromDeps(book)
            }

        }

        try {
            userService.save(user)
        } catch (ValidationException e) {
            respond user.errors, view:'edit'
            return
        }

        def deps = params.list('dep')

        for(String d in deps){
            def departa =  Dep.findById(Long.parseLong(d))
            user.addToDeps(departa).save(flush: true)
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'usuario.label', default: 'Usuario'), user.id])
                redirect user
            }
            '*'{ respond user, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }


        Usuario u = Usuario.findById(id)

        if(u.deps.size() != 0){
            for(Dep d in departamentoService.list()){

                def book = u.deps.find { it.id == d.id }

                if(book != null)
                    u.removeFromDeps(book)
            }

        }



        userRoleService.delete(UsuarioRol.findByUser(u))



       userService.delete(id)

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
