class Persona {
  var monedas = 20
  var años

  method recursos() = monedas
  method años() = años
  method esDestacado() = años.between(18, 65) or monedas > 30

  method ganarMonedas(cantidad) {
    monedas += cantidad
  }
  method gastarMonedas(cantidad) {
    monedas = (monedas -cantidad).max(0)
  }
  method cumplirAños() {
    años += 1
  }
  method trabajarDuranteEnPlaneta(tiempo, planeta) {}

}

// Otras Personas

class Productor inherits Persona {
  const tecnicas = ["cultivo"]
  var planetaEnElQueVive

  method tecnicas() = tecnicas
  method cantidadDeTecnicasQueConoce() = tecnicas.size()
  override method recursos() = super() * self.cantidadDeTecnicasQueConoce()
  override method esDestacado() = super() or self.cantidadDeTecnicasQueConoce() > 5
  method conoceLaTecnica(tecnica) = tecnicas.contains(tecnica)

  method realizarTecnicaDurante(tecnica, tiempo) {
    if (self.conoceLaTecnica(tecnica)) {
      self.ganarMonedas(3 * tiempo)
    }
    else {
      self.gastarMonedas(1)
    }
  }
  method aprenderTecnica(nuevaTecnica) { tecnicas.add(nuevaTecnica) }
  override method trabajarDuranteEnPlaneta(tiempo, planeta) {
    if (planeta == planetaEnElQueVive) {
      self.realizarTecnicaDurante(tecnicas.last(), tiempo)
    }
  }
}

class Constructor inherits Persona {
  var cantidadConstruccionesRealizadas
  var region
  var esInteligente

  override method recursos() = super() + 10 * cantidadConstruccionesRealizadas
  override method esDestacado() = cantidadConstruccionesRealizadas > 5
  method esInteligente() = esInteligente
  
  override method trabajarDuranteEnPlaneta(tiempo, planeta) {
    cantidadConstruccionesRealizadas += 1
    self.gastarMonedas(5)
    planeta.agregarConstruccion(region.construye(tiempo, self))
  }

}

