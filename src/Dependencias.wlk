import FlotaDeRodados.*
import AutosEspeciales.*

class Dependencia {
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
	method colorDelRodadMasRapido() {
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
}