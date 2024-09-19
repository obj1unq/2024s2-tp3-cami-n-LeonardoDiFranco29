object knightRider {
	method peso() { return 500 }
	method nivelPeligrosidad() { return 10 }
}

object bumblebee {

	var tipo = robot 

	method peso() { return 800 }
	method nivelPeligrosidad() { return calcularPeligrosidad() }
	
	method calcularPeligrosidad() {
		if (esRobot()) {
			return 30
		} else (esAuto()){
			return 15
		}
	}

	method esRobot() {
		return tipo = robot
	}
	method esAuto(tipo) {
		return tipo = auto
	}
}

object paqueteDeLadrillos {

	var property cantLadrillos = 5

	method peso() { return self.pesoTotalLadrillo() }
	method nivelPeligrosidad() { return 2 }
	method pesoTotalLadrillo() {
	  return cantLadrillos * 2
	}
	
	method cantLadrillos(_cantLadrillos) {
			cantLadrillos = _cantLadrillos
	}
}

object arenaAGranel {
	method peso() { return 500 }
	method nivelPeligrosidad() { return 10 }
}

object bateriaAntiaerea {
	method peso() { return 500 }
	method nivelPeligrosidad() { return 10 }
}

object contenedorPortuario {
	method peso() { return 500 }
	method nivelPeligrosidad() { return 10 }
}

object residuosRadioActivos {
	method peso() { return 500 }
	method nivelPeligrosidad() { return 10 }
}

object embalejeDeSeguridad {
	method peso() { return 500 }
	method nivelPeligrosidad() { return 10 }
}



