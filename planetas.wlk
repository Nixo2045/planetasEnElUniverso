class Planeta {
    const personas = []
    const construcciones = []

    method personas() = personas
    method construcciones() = construcciones
    method esValioso() = construcciones.all({ p => p.valor() > 100})
    
    method delegacionDiplomatica() = self.habitantesDestacados() + [ self.habitanteConMasRecursos() ]
    method habitantesDestacados() = personas.filter({ p => p.esDestacado() })
    method habitanteConMasRecursos() = personas.max({ p => p.recursos() })
    
    method agregarPersona(persona) { personas.add(persona) }
    method sacarPersona(persona) { personas.remove(persona) }
    method agregarConstruccion(construccion) { construcciones.add(construccion) }
    method sacarConstruccion(construccion) { construcciones.remove(construccion) }
}