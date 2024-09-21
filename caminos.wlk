import camion.*
object ruta9 {
    method permiteViaje(camion) {
        return camion.puedeCircularEnRuta(11)
    }
}

object caminosVecinales {
    var pesoMaximoSoportado = 2800 

    method permiteViaje(camion) {
        return camion.pesoTotal() <= pesoMaximoSoportado
    }

    method pesoMaximoSoportado(_pesoMaximoSoportado) {
            pesoMaximoSoportado = _pesoMaximoSoportado
    }
}