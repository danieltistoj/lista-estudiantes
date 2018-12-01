require 'terminal-table'
class Pila
  def initialize
    @pila = {
      tope: nil,
      max: -1,
      size: 0,
      esta_vacia: true
    }
  end
  def mandar_pila
    @pila
  end
  def mandar_posicion
    @pila[:size]
  end

  def obtener_max
    @pila[:max]
  end

  def ingresar_nodo(nodo)
    if @pila[:esta_vacia]
      @pila[:tope]=nodo
      @pila[:esta_vacia]=false
      @pila[:size]+=1
    else
      tope = @pila[:tope]
      nodo[:siguiente]=tope
      @pila[:tope]=nodo
      @pila[:size]+=1
    end
end

  def buscar_carnet(carnet)
    if @pila[:esta_vacia]
      existe = false
      return existe
    else
      elemento = @pila[:tope]
      begin

        if carnet == elemento[:carnet]
          existe = true
          return existe
          break
        end
          elemento = elemento[:siguiente]

      end while elemento!=nil
        existe=false
        return existe
    end
  end

  def mostrar_pila
    elemento = @pila[:tope]
    tabla = Terminal::Table.new do |a|
  a.title= 'Lista de Estudiantes'
  a.headings = [{value:'Posicion', alignment: :center},{value:'Estudinate', alignment: :center},{value:'Carnet', alignment: :center}]
  loop do
  a.add_row([
    {value: elemento[:posicion], alignment: :center},
    {value: elemento[:nombre], alignment: :center},
    {value: elemento[:carnet], alignment: :center},
    ])

    if elemento[:siguiente]==nil
      break
    end
    elemento=elemento[:siguiente]
  end
end
return tabla
end

def obtener_por_carnet(carnet)
    if @pila[:esta_vacia]
      existe = false
      return existe
    else
      elemento = @pila[:tope]
      begin

        if carnet == elemento[:carnet]
          return elemento
          break
        end
          elemento = elemento[:siguiente]

      end while elemento!=nil
        existe=false
        return existe
    end
end

def obtener_por_posicion(posicion)
    if @pila[:esta_vacia]
      existe = false
      return existe
    else
      elemento = @pila[:tope]
      begin
        if posicion == elemento[:posicion]
          return elemento
          break
        end
          elemento = elemento[:siguiente]

      end while elemento!=nil
        existe=false
        return existe
    end
end

def eliminar_nodo
  if @pila[:tope] == nil
    return 'No hay elementos a eliminar'
  elsif @pila[:tope][:siguiente]==nil
    aux = @pila[:tope]
    @pila[:tope]=nil
    @pila[:size]=0
    @pila[:esta_vacia]=true
    return "Se elimino el estudiante #{aux[:nombre]} "
  else
    aux = @pila[:tope]
    @pila[:tope]=@pila[:tope][:siguiente]
    @pila[:size]-=1
    return "Se elimino el estudiante #{aux[:nombre]}"
  end
end

def definir_max_elemento(num)
    if num<0
      @pila[:max] = num
    else
      borrar = @pila[:size]-num
      if borrar>0
        for i in 1..borrar
          @pila[:tope]=@pila[:tope][:siguiente]
          @pila[:size]-=1
        end
        @pila[:max]=num
      else
        @pila[:max] = num
      end
    end
  end

  def tomar_asistencia(carnet)

  end
end

