object knightRider {
	method peso() { return 500 }
	method nivelPeligrosidad() { return 10 }
	method bultos() { return 1 }

	method reaccionarAlCargar() {
        
    }
}

/*object bumblebee {

	var tipo = robot 

	method peso() { return 800 }
	method nivelPeligrosidad() { return self.calcularPeligrosidad() }
	
	method calcularPeligrosidad() {
		if (esRobot()) {
			return 30
		} else (esAuto()){
			return 15
		}
	}

	method esRobot() {
		return robot
	}
	method esAuto() {
		return auto
	}
}*/

object bumblebeeAuto {
    method peso() { return 800 }
    method nivelPeligrosidad() { return 15 }
	method bultos() { return 2 }

	method reaccionarAlCargar() {
        	camion.cargar(bumblebeeRobot)
    }
}

object bumblebeeRobot {
    method peso() { return 800 }
    method nivelPeligrosidad() { return 30 }
	method bultos() { return 2 }

	method reaccionarAlCargar() {
        
    }
}


object paqueteDeLadrillos {
    var cantidadDeLadrillos = 0  

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

	method bultos() {
        if (conMisiles) {
            return 2
        } else {
            return 1
        }
    }

	method reaccionarAlCargar() {
        conMisiles = true  // agregarMisiles()
    }


     /*method agregarMisiles() {
        conMisiles = true
    }

    method quitarMisiles() {
        conMisiles = false
    }*/
}


object contenedorPortuario {
    const cosas = #{}
    
    method peso() {
        return 100 + cosas.sum({cosa => cosa.peso()})
    }

    method nivelPeligrosidad() {
        if (cosas.isEmpty()) {
            return 0
        } else {
            return cosas.max({cosa => cosa.nivelPeligrosidad()})
        }
    }

    method agregarCosa(cosa) {
        cosas.add(cosa)
    }

    method removerCosa(cosa) {
        cosas.remove(cosa)
    }

	method bultos() {
        return 1 + cosas.sum({ cosa => cosa.bultos() })
    }

	method reaccionarAlCargar() {
        cosas.forEach({cosa => cosa.reaccionarAlCargar()})  // que para cada cosa reaccione 
    }														//(dijieron que no ibamos a usar for each)
}


object residuosRadioactivos {
    var pesoActual = 0   

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

