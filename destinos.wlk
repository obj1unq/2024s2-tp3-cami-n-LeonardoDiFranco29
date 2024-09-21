import camion.*
import cosas.*


object almacen{
    var capacidadMaximaDeBultos = 8  
    const property cosas = #{}

    method puedeRecibir(nuevosBultos) {
        return cosas.sum({ cosa => cosa.bultos() }) + nuevosBultos <= capacidadMaximaDeBultos
    }

    method recibir(cosa) {
        cosas.add(cosa)
    }

    method capacidadMaximaDeBultos(_capacidadMaximaDeBultos) {
       capacidadMaximaDeBultos = _capacidadMaximaDeBultos
    }
}
