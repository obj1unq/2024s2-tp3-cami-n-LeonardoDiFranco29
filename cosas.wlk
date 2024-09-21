import camion.*
object knightRider {
	method peso() { return 500 }
	method nivelPeligrosidad() { return 10 }
	method bultos() { return 1 }

	method reaccionarAlCargar() {
        
    }
}

object bumblebee {

	var forma = bumblebeeAuto 

	method peso() { return 800 }
	method nivelPeligrosidad() { return forma.nivelPeligrosidad() }
	method forma(_forma){
        forma = _forma
    }
    method forma() {
      return forma
    }
    
    method bultos() { return 2 }
    
    method reaccionarAlCargar() {
            self.forma(bumblebeeRobot)
    }
}

object bumblebeeAuto {
    method peso() { return 800 }
    method nivelPeligrosidad() { return 15 }
	method bultos() { return 2 }

	//method reaccionarAlCargar() {
            //camion.cargar(bumblebeeRobot)
            //camion.descargar(self)
            
    //}
}

object bumblebeeRobot {
    method peso() { return 800 }
    method nivelPeligrosidad() { return 30 }
	method bultos() { return 2 }

	method reaccionarAlCargar() {
        
    }
}


object paqueteDeLadrillos {
    var cantidadDeLadrillos = 5  

    method peso() {
        return cantidadDeLadrillos * 2  
    }

    method nivelPeligrosidad() {
        return 2
    }

    method agregarLadrillos(cantidad) {
        cantidadDeLadrillos += cantidad
    }

	method cantidadDeLadrillos(_cantidadDeLadrillos) {
			cantidadDeLadrillos = _cantidadDeLadrillos        
	}
    method cantidadDeLadrillos() {
      return cantidadDeLadrillos
    }

	method bultos() {
        if (cantidadDeLadrillos <= 100) {
            return 1
        } else if (cantidadDeLadrillos <= 300) {
            return 2
        } else {
            return 3
        }
    }

	method reaccionarAlCargar() {
        cantidadDeLadrillos += 12  // agregarLadrillos(12)
    }

}


object arenaAGranel {
    var pesoActual = 0  

    method peso() {
        return pesoActual
    }

    method nivelPeligrosidad() {
        return 1
    }

    method agregarPeso(peso) {
        pesoActual += peso // pesoActual = pesoActual + peso 
    }
	method pesoActual(_pesoActual) {
		pesoActual = _pesoActual
	}

	method bultos() { return 1 }

	 method reaccionarAlCargar() {
        pesoActual += 20  // agregarPeso(20)
    }

}


object bateriaAntiaerea {
    var conMisiles = false  

    method peso() {
        if (conMisiles) {
            return 300
        } else {
            return 200
        }
    }

    method nivelPeligrosidad() {
        if (conMisiles) {
            return 100
        } else {
            return 0
        }
    }

	method conMisiles(_conMisiles) {
			conMisiles = _conMisiles
	}
    method conMisiles() {
      return conMisiles
    }

	method bultos() {
        if (conMisiles) {
            return 2
        } else {
            return 1
        }
    }

	method reaccionarAlCargar() {
        conMisiles = true  // es lo mismo que agregarMisiles()
    }


     /*method agregarMisiles() {
        conMisiles = true
    }

    method quitarMisiles() {
        conMisiles = false
    }*/
}


object contenedorPortuario {
    const contenido = #{}
    
    method peso() {
        return contenido.sum({cosa => cosa.peso()}) + 100
    }

    method nivelPeligrosidad() {
    if (contenido.isEmpty()) {
        return 0
    } else {
        return contenido.map({ cosa => cosa.nivelPeligrosidad() }).max()
    }
    }

    method agregarCosa(cosa) {
        contenido.add(cosa)
    }

    method removerCosa(cosa) {
        contenido.remove(cosa)
    }

	method bultos() {
        return 1 + contenido.sum({ cosa => cosa.bultos() })
    }

	method reaccionarAlCargar() {
        contenido.forEach({cosa => cosa.reaccionarAlCargar()})  // que para cada cosa reaccione 
    }														//(dijieron que no ibamos a usar for each)
}


object residuosRadioactivos {
    var pesoActual = 500  

    method peso() {
        return pesoActual
    }

    method nivelPeligrosidad() {
        return 200
    }

    method agregarPeso(peso) {
        pesoActual += peso
    }

	method bultos() { return 1 }

	method reaccionarAlCargar() {
        pesoActual += 15  // agregarPeso(15)
    }
}


object sinLaCosa {
    method peso() {
        return 0
    }

    method nivelPeligrosidad() {
        return 0
    }
}

object embalajeDeSeguridad {
    var cosaEnvuelta = sinLaCosa  

    method peso() {
        return cosaEnvuelta.peso()
    }

    method nivelPeligrosidad() {
        return cosaEnvuelta.nivelPeligrosidad() / 2
    }
	
    method envolver(cosa) {
        cosaEnvuelta = cosa
    }

    method desenvolver() {
        cosaEnvuelta = sinLaCosa
    }

	method bultos() {
        return 2
    }

	method reaccionarAlCargar() {
        
    }
}

