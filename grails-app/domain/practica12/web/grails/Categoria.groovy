package practica12.web.grails

class Categoria {

    String nombre
    String descripcion
    Usuario usuario
    Date fecha

    static constraints = {
        usuario nullable: true
        nombre blank: false
        descripcion blank: false
    }
}
