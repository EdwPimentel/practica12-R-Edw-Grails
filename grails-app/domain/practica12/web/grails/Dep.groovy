package practica12.web.grails

class Dep {

    String nombre
    String descripcion
    Usuario usuario
    Date fecha
    static hasMany = [conts: Contacto]

    static constraints = {
        usuario nullable: true
        nombre blank: false
        descripcion blank: false

    }

}
