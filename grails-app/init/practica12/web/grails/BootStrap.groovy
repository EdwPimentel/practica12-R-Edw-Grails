package practica12.web.grails

class BootStrap {

    def init = { servletContext ->

        if(Usuario.count == 0){

            def normal = new Usuario(username: 'normal', password: 'normal',fecha: new Date()).save(failOnError: true)

            def admin = new Usuario(username: 'admin', password: 'admin',fecha: new Date()).save(failOnError: true)

            def aRole = new Rol(authority: 'ROLE_ADMIN').save()

            def nRole = new Rol(authority: 'ROLE_USER').save()

            def r = new UsuarioRol(user: admin,role: aRole).save(failOnError: true)

            def r2 = new UsuarioRol(user: normal,role: nRole).save(failOnError: true)


        }


    }
    def destroy = {
    }
}
