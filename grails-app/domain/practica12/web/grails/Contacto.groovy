package practica12.web.grails

class Contacto  {

    String nombre
    String apellido
    String email
    String direccion
    String puesto
    String telefono
    Categoria categoria
    Usuario usuario
    Date fecha
    static hasMany = [deps: Dep]
    static belongsTo = Dep

    static constraints = {
        email unique: true, email: true, blank: false
        telefono unique: true, blank: false
        usuario nullable: true, blank: false
        nombre blank: false
        apellido blank: false
        direccion blank: false
        puesto blank: false
        telefono blank: false
    }


}
