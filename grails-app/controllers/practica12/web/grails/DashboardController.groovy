package practica12.web.grails

import grails.plugin.springsecurity.annotation.Secured

@Secured(["ROLE_ADMIN","ROLE_USER"])
class DashboardController {

    CategoriaService categoriaService
    DepService depService
    ContactoService contactoService

    def index() {


        render(view: "/dashboard",model: ['contactos': contactoService.list(), 'categorias': categoriaService.list(), 'departamentos': depService.list()])
    }

}
