import cosas.*

object camion {
	const property cosas = #{}
		
	method cargar(unaCosa) {
		cosas.add(unaCosa)
	}

	method descargar(unaCosa) {
		cosas.remove(unaCosa)
	}

	method todoPesoPar(){
		return not cosas.all({cosa => cosas.peso().odd() })
	}

	method hayAlgunoQuePesa(peso) {
		return cosas.any({cosa => cosas.peso() == peso})
	}

	method elDeNivel(nivel) {
		// return cosas.find({cosa => cosas.nivelPeligrosidad() == nivel})
		return cosas.filter({cosa => cosas.nivelPeligrosidad() == nivel}).head()
	}
	method pesoTotal() {
		return cosas.sum({cosa => cosas.peso()}) + 1000
	}

	method excedidoDePeso() {
	  return self.pesoTotal() == 2500
	}

	method objetosQueSuperanPeligrosidad(nivel) {
		return cosas.filter({cosa => cosas.nivelPeligrosidad() > nivel})
	}

	method objetosMasPeligrososQue(unaCosa) {
	  return cosas.filter({cosa => cosas.nivelPeligrosidad() > unaCosa.nivelPeligrosidad()})
	}

	method puedeCircularEnRuta(nivelMaximoPeligrosidad) {
		return self.excedidoDePeso() and self.noSuperanElNivelMaximo(nivelMaximoPeligrosidad)
	}
	method noSuperanElNivelMaximo(nivelMaximo) {
	  return not cosas.all({cosa => cosas.nivelPeligrosidad() > nivelMaximo})
	}
}
