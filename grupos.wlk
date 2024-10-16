import gladiadores.*
import armas.*

class Grupo {
  const property gladiadores = []
  const property nombre 
  var peleas = 0

  method agregarGladiador(unGladiador) {
    gladiadores.add(unGladiador)
  }

  method quitarGladiador(unGladiador) {
    gladiadores.remove(unGladiador)
  }

  method aumentarPeleas() {
    peleas += 1
  }

  method combatir(otroGrupo) {
    self.aumentarPeleas()
    otroGrupo.aumentarPeleas()
    (1..3).forEach({round => self.gladiadorMasFuerte().pelear(otroGrupo.gladiadorMasFuerte())})
  }

  method gladiadorMasFuerte() {
    const puedenPelear = gladiadores.filter({g => g.puedePelear()})
    if(puedenPelear.isEmpty()){
        self.error("No hay gladiadores que puedan pelear")
    }
    return puedenPelear.max({g => g.fuerza()})
  }
}
