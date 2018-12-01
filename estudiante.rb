class Estudiante
  def initialize(nombre,carnet,posicion)
    @nodo = {
      nombre:nombre,
      carnet:carnet,
      posicion:posicion,
      siguiente: nil,
      asistencia: []
    }

  end
  def mandar_nodo
    @nodo
  end
end
