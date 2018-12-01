require 'terminal-table'
require_relative 'pila'
require_relative 'estudiante'
def limpiar_pantalla
  system ('clear')
end
#ingresar nuevo nodo / estudiante.
def nuevo_nodo(pila)
  max=pila.obtener_max
  aux=pila.mandar_pila
  if max<0
  print  'Ingrese nombre: '
  nombre = gets.chomp
  print 'Ingrese carnet: '
  carnet = gets.chomp
  existe_carnet = pila.buscar_carnet(carnet)
  if existe_carnet
    puts 'Este carnet ya existe en el sistema'
    gets
  else
    posicion = pila.mandar_posicion
  nodo = Estudiante.new(nombre,carnet,posicion)
  pila.ingresar_nodo(nodo.mandar_nodo)
  end
else
  if max>aux[:size]
  print  'Ingrese nombre: '
  nombre = gets.chomp
  print 'Ingrese carnet: '
  carnet = gets.chomp
  existe_carnet = pila.buscar_carnet(carnet)
  if existe_carnet
    puts 'Este carnet ya existe en el sistema'
    gets
  else
    posicion = pila.mandar_posicion
  nodo = Estudiante.new(nombre,carnet,posicion)
  pila.ingresar_nodo(nodo.mandar_nodo)
  end
  else
    puts 'Ya no tiene espacio para mas estudiantes'
    gets
  end
end
end
#ver la lista de estudiantes
def ver_lista_estudiantes(pila)
  aux=pila.mandar_pila
  if aux[:tope]==nil
    print 'no hay estudiantes en el sistema'
  else
    puts pila.mostrar_pila
  end
  gets
end
#buscar un elemento por carnet.
def buscar_por_carnet(pila)
  print 'Ingrese el carnet: '
  carnet = gets.chomp
  nodo = pila.obtener_por_carnet(carnet)
  if nodo == false
    print 'El estudiante no existe en el sistema'
  else
  tabla = Terminal::Table.new do |a|
  a.title= 'Lista de Estudiantes'
  a.headings = [{value:'Posicion', alignment: :center},{value:'Estudinate', alignment: :center},{value:'Carnet', alignment: :center}]

  a.add_row([
    {value: nodo[:posicion], alignment: :center},
    {value: nodo[:nombre], alignment: :center},
    {value: nodo[:carnet], alignment: :center},
    ])
  end
  tabla1 = Terminal::Table.new do |a|
  a.headings = [{value:'Asistencia ', alignment: :center}]
  nodo[:asistencia].each do |i|
  a.add_row([
    {value: i, alignment: :center},
    ])
  end
  end
  puts tabla
  puts tabla1
  end
  gets
end
#busca un elemento por posicion
def buscar_por_posicion(pila)
  print 'Ingrese la posicion '
  posicion = gets.to_i
  nodo = pila.obtener_por_posicion(posicion)
  if nodo == false
    print 'El estudiante no existe en el sistema'
  else
  tabla = Terminal::Table.new do |a|
  a.title= 'Lista de Estudiantes'
  a.headings = [{value:'Posicion', alignment: :center},{value:'Estudinate', alignment: :center},{value:'Carnet', alignment: :center}]
  a.add_row([
    {value: nodo[:posicion], alignment: :center},
    {value: nodo[:nombre], alignment: :center},
    {value: nodo[:carnet], alignment: :center},
    ])
  end
  puts tabla
  end
  gets
end
#funcion definir numero maximo de elementos
def definir_max(pila)
  print 'defina un numero maximo de alumnos: '
  num= gets.to_i
  pila.definir_max_elemento(num)
end
#tomar asistencia
def tomar_asistencia(pila) #tomar asistencia
  pila_1=pila.mandar_pila
if pila_1[:tope] == nil
  puts 'El sistema no tiene estudiantes'
else
  print 'Ingrese el carnet: '
  carnet = gets.chomp
  nodo = pila.obtener_por_carnet(carnet)
  if nodo == false
    puts 'El estudiante no existe en el sistema'
  else
    t = Time.now
    fecha_hora=t.strftime("%d/%m/%Y - %H:%M:%S")
    nodo[:asistencia].push(fecha_hora)
    limpiar_pantalla
    puts "Se le ha sumado una asistencia al estudiante #{nodo[:nombre]}: #{fecha_hora}"
  end
end
  gets
end

#menu principla
pila = Pila.new
tabla = Terminal::Table.new do |a|
  a.title= 'Octava Practica De Laboratorio'
  a.headings = [{value:'No.', alignment: :center},{value:'Opciones', alignment: :center}]

  a.add_row([{value:'1', alignment: :center},'Ingresar un nuevo estudiante.' ])
  a.add_row([{value:'2', alignment: :center},'Ver todos los estudiante.'])
  a.add_row([{value:'3', alignment: :center},'Buscar un estudiante por carnet.'])
  a.add_row([{value:'4', alignment: :center},'Buscaar un elemento pos posicion.' ])
  a.add_row([{value:'5', alignment: :center},'Definir numero maximo de estudiantes.' ])
  a.add_row([{value:'6', alignment: :center},'Tomar asistencia.' ])
  a.add_row([{value:'7', alignment: :center},'Eliminar un estudiante.' ])
  a.add_row([{value:'8', alignment: :center},'Salir.' ])
end
begin
limpiar_pantalla
puts tabla
print 'Ingrese una opcion: '
opc = gets.chomp
limpiar_pantalla()
case opc
when '1'
  nuevo_nodo(pila)
when '2'
  ver_lista_estudiantes(pila)
when '3'
  buscar_por_carnet(pila)
when '4'
  buscar_por_posicion(pila)
when '5'
  definir_max(pila)
when '6'
    tomar_asistencia(pila)
when '7'
  puts pila.eliminar_nodo
  gets
when '8'
  puts 'Programa finalizado'
else
  print 'Ingreso un valor erroneo'
  gets
end
end while opc!='8'
