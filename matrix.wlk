object neo {
    var energia = 100
    method esElElegido() = true 
    method energia() = energia
    method saltar(){
        energia = energia / 2
    }
    method vitalidad() {
      energia = energia / 10
    }
}

object morfeo {
  var vitalidad = 8
  var estaCansado = false
  method vitalidad() = vitalidad 
  method cambiarVitalidad(cant) {
    vitalidad = cant
  } 
  method esElElegido() = false
  method saltar() {
    estaCansado = !estaCansado
    vitalidad = vitalidad - 1
  }

}

object trinity {
  method vitalidad() = 0
  method esElElegido() = false
  method saltar() {}
}

object nave {
  const pasajeros = []
  method cantidadDePasajeros() = pasajeros.size()
  method pasajeroConMayorVitalidad() = pasajeros.max({p =>p.vitalidad()})
  method pasajeroConMenorVitalidad() = pasajeros.min({p => p.vitalidad()})
  
  method estaEquilibradaEnVitalidad() = self.pasajeroConMayorVitalidad().vitalidad() <= self.pasajeroConMenorVitalidad().vitalidad() * 2
  method elElegidoEstaEnLaNave() = pasajeros.any({p => p.esElElegido()})
  method chocarNave() {
    pasajeros.forEach({p => p.saltar()})
    pasajeros.clear()
  }  
  
  method acelerarNave() = pasajeros.filter({p => !p.esElElegido()}).forEach({p => p.saltar()})
}