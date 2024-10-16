class ArmaDeFilo {
  const property longitud
  var property filo  

  method valorDeAtaque() = longitud * filo
}

class ArmaContundentes {
  const property peso 

  method valorDeAtaque() = peso
}

object casco {
  method defensa(unGladiador) = 10 
}

object escudo {
  method defensa(unGladiador) = 5 + (unGladiador.destreza() * 0.1) 
}
