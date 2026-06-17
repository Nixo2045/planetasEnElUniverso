import construcciones.*

object montaña {
  method construye(horas, constructor) = new Muralla(longitud = horas * 0.5)
}

object costa {
  method construye(horas, constructor) = new Museo(superficieCubierta = horas, indiceDeImportancia = 1)
}

object llanura {
  method nivelProporcional(constructor) = (constructor.recursos() / 20).clamped(1, 5)
  
  method construye(horas, constructor) {
    return if(!constructor.esDestacado()) {
      new Muralla(longitud = horas * 0.5)
    }
    else {
      new Museo(superficieCubierta = horas, indiceDeImportancia = self.nivelProporcional(constructor))
    }
  }
}

object bosque {
  method construye(horas, constructor) {
    return if(constructor.esInteligente()) {
      new Museo(superficieCubierta = horas, indiceDeImportancia = 3)
    }
    else {
      new Muralla(longitud = horas * 0.5)
    }
  }
}