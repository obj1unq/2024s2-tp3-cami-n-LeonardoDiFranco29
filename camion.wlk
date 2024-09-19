import cosas.*
import caminos.*
import destinos.*
object camion {
	const property cosas = #{}
		
	method cargar(unaCosa) {
		cosas.add(unaCosa)
		unaCosa.reaccionarAlCargar()
	}

	method descargar(unaCosa) {
		cosas.remove(unaCosa)
	}

	method todoPesoPar(){
		return not cosas.all({cosa => cosa.peso().odd() })
	}

	method hayAlgunoQuePesa(peso) {
		return cosas.any({cosa => cosa.peso() == peso})
	}

	method elDeNivel(nivel) {
		return cosas.find({cosa => cosa.nivelPeligrosidad() == nivel})
		//return cosas.filter({cosa => cosa.nivelPeligrosidad() == nivel}).head()
	}
	method pesoTotal() {
		return cosas.sum({cosa => cosa.peso()}) + 1000
	}

	method excedidoDePeso() {
	  return self.pesoTotal() == 2500
	}

	method objetosQueSuperanPeligrosidad(nivel) {
		return cosas.filter({cosa => cosa.nivelPeligrosidad() > nivel})
	}

	method objetosMasPeligrososQue(unaCosa) {
	  return cosas.filter({cosa => cosa.nivelPeligrosidad() > unaCosa.nivelPeligrosidad()})
	}

	method puedeCircularEnRuta(nivelMaximoPeligrosidad) {
		return self.excedidoDePeso() and self.noSuperanElNivelMaximo(nivelMaximoPeligrosidad)
	}
	method noSuperanElNivelMaximo(nivelMaximo) {
	  return not cosas.all({cosa => cosa.nivelPeligrosidad() > nivelMaximo})
	}

	method tieneAlgoQuePesaEntre(min,max) {
		return cosas.any({cosa => cosa.peso() > min and cosa.peso() < max})
	}

	method cosasMasPesada() {
	  return cosas.max({cosa => cosa.peso()})
	}

	method pesos() {
	  return cosas.map({cosa => cosa.peso()})
	}

	method totalBultos() {
        return cosas.sum({ cosa => cosa.bultos() })
    }

	method transportar(destino, camino) {
        self.validarTransporte(destino, camino) 
		cosas.forEach({ cosa => destino.recibirCosa(cosa) }) // todas las cosas que están en el camión pasan al almacén
        cosas.clear()  // con clear limpio/vacio el camion porque le di las cosas al almacen
    }

	method validarTransporte(destino, camino) {
    self.validarPesoExcedido()
    self.validarCaminoSoportado(camino)
    self.validarCapacidadDestino(destino)
	}

	method validarPesoExcedido() {
    if (self.excedidoDePeso()) {
        self.error("El camión está excedido de peso!")
    }
}

method validarCaminoSoportado(camino) {
    if (not camino.permiteViajar(self)) {
        self.error("El camino no soporta el viaje!")
    }
}

method validarCapacidadDestino(destino) {
    if (not destino.puedeRecibir(self.totalBultos())) {
        self.error("El destino no puede recibir más bultos!")
    }
}

}
