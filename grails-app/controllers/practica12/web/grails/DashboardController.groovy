package practica12.web.grails

import grails.plugin.springsecurity.annotation.Secured

@Secured(["ROLE_ADMIN","ROLE_USER"])
class DashboardController {

    CategoriaService categoriaService
    DepService departamentoService
    ContactoService contactoService

    def index() {


        render(view: "/index",model: ['contactos': contactoService.list(),'categorias': categoriaService.list(), 'departamentos': departamentoService.list()])
    }

}
