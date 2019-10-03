class Corsa {
	var property color
	method velocidadMax() { return 150 }
	method peso() { return 1300 }
	method capacidad() { return 4 }
}

class Kwid {
	var property tAdicional = false
	method color() { return "azul" }
	method velocidadMax() { return if(tAdicional){120} else {110} }
	method peso() { return if (tAdicional) {1200+150} else {1200} }
	method capacidad() { return if(tAdicional){3}else{4} }
}

object traffic {
	var property interior
	var property motor
	method capacidad()= return interior.capacidad()
	method velocidadMax()= return motor.velocidad()
	method peso() { return motor.peso()+interior.peso()+4000 }
	method color() { return "blanco" }
}

object interiorComodo {
	method Capacidad() { return 5 }
	method peso() { return 700 }
}

object interiorPopular {
	method capacidad() { return 12 }
	method peso() { return 1000 }
}

object motorBataton {
	method peso() {
		return 500
	}
	method velocidad() {
		return 80
	}
}

object motorPulenta {
	method velocidad() {
		return 130
	}
	
	method peso() {
		return 800
	}
}

class Especial {
	var property capacidad
	var property velocidadMax
	var property peso
	var property color
}

class Dependencia {
	var pedidos
	var flota = []
	var empleados = []
	method agregarAFlota(rodado) {
		flota.add(rodado)
	}
	method quitarDeFlota(rodado) {
		flota.remove(rodado)
	}
	method pesoTotalDeFlota() {
		return flota.sum({c=>c.peso()})
	}
	method estaBienEquipadoEnTamanio() {
		return flota.size()>=3
	}
	method estaBienEquipadoEnVelocidad() {
		return flota.all({c=>c.velocidad()>=100})
	}
	method estaBienEquipada() {
		return self.estaBienEquipadoEnTamanio() and self.estaBienEquipadoEnVelocidad()
	}
	method rodadoEnColor(color) {
		return flota.filter({c=>c.color()==color})
	}
	method capacidadTotalEnColor(unColor) {
		return self.rodadoEnColor(unColor).sum({c=>c.capacidad()})
	}
	method colorDelRodadoMasRapido() {
		return flota.max({c=>c.velocidad()}).color()
	}
	method capacidadTotal() {
		return flota.sum({c=>c.capacidad()})
	}
	method capacidadFaltante() {
		return 0.max({empleados - self.capacidadTotal()})
	}
	method esGrande() {
		return empleados.size()>=40 and flota.size()>=5
	}
	method noPuedenSerSatisfechos() {
		return pedidos.filter({e=>not self.puedeSerSatisfecho(e)})
	}
	method puedeSerSatisfecho(pedido) {
		return flota.any({a=>pedido.puedeSatisacerUnPedido(a)})
	}
}

//velocidad requerida del pedido = dist / tiemp

class Pedidos {
	var property distancia
	var property tiempoMaximo
	var property cantdPasajeros
	var coloresIncompatibles = []
	
	method velocidad() { return distancia / tiempoMaximo }
	
	method puedeSatisfacerUnPedido(auto) {
		return auto.velocidadMax() - self.velocidad() >= 10
		and auto.capacidad() >= cantdPasajeros
		and not coloresIncompatibles.any({c=>c==auto.color()})
	}
	method acelerar() {
		tiempoMaximo = 1.max(tiempoMaximo -1) //como estoy bucando el min uso el max
	}
	method relajar() {
		tiempoMaximo = 1.max(tiempoMaximo + 1)
	}
}