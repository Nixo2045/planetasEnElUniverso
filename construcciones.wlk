class Muralla {
    var longitud
    
    method longitud() = longitud
    method valor() = longitud * 10
}

class Museo {
    var superficieCubierta
    var indiceDeImportancia
    
    method valor() {
        self.validarIndice()
        return superficieCubierta * indiceDeImportancia
    }
    method indiceDeImportancia() = indiceDeImportancia
    method superficieCubierta() = superficieCubierta

    method validarIndice() {
        if (not indiceDeImportancia.between(1, 5)) {
            self.error("El índice de importancia debe estar entre 1 y 5")
        }
    }
    
}