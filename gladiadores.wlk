import grupos.*
import armas.*

class Mirmillones {
  var vida = 100
  const property arma   
  var property armadura 
  var property fuerza 

   method destreza() = 15

   method vida() = vida 

   method atacar(unGladiador) {
     unGladiador.recibirAtaque(self.poderDeAtaque())
   }

   method recibirAtaque(unValor) {
     vida = vida - 0.max(unValor - self.defensa())
   }

   method poderDeAtaque() = arma.valorDeAtaque() + fuerza

   method defensa() = armadura.defensa(self) + self.destreza()

   method pelear(unGladiador) {
     self.atacar(unGladiador)
     unGladiador.atacar(self)
   }

   method puedePelear() = vida > 0

   method crearUnGrupo(otroGladiador) {
     const nuevoGrupo = new Grupo(gladiadores = [self,otroGladiador],nombre = "mirmillolandia")
     return nuevoGrupo
   }
}

class Dimachaerus {
  var vida = 100
  const property armas = []
  var property destreza  

  method fuerza() = 10

  method vida() = vida

  method atacar(unGladiador) {
     unGladiador.recibirAtaque(self.poderDeAtaque())
    destreza += 1
   }

   method recibirAtaque(unValor) {
     vida = vida - 0.max(unValor - self.defensa())
   }

   method poderDeAtaque() = self.fuerza() + armas.sum({a => a.valorDeAtaque()})

   method defensa() = destreza * 0.5

   method pelear(unGladiador) {
     self.atacar(unGladiador)
     unGladiador.atacar(self)
   }

   method puedePelear() = vida > 0

   method crearUnGrupo(otroGladiador) {
     const nuevoGrupo = new Grupo(gladiadores = [self,otroGladiador],nombre = "D-" + (self.poderDeAtaque() + otroGladiador.poderDeAtaque()))
     return nuevoGrupo
   }
}