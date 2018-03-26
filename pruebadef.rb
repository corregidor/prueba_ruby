#Metodo para ejercicio 1
def escribir_promedio_alumno(nombre, promedio)
  file = File.open('Promedios.txt','a')
  file.puts("#{nombre}: #{promedio}")
  file.close
end

#Método para ejercicio 3
def mostrar_aprobados (c=5)
  file = File.open('notas.csv','r')
  data = file.readlines
  file.close

  data.each do |line|
    arreglo = line.split(', ')
    nombre = arreglo[0]
    promedio = (arreglo[1].to_i + arreglo[2].to_i + arreglo[3].to_i + arreglo[4].to_i + arreglo[5].to_i)/5.0
    #arreglo debe estar parametrizado su largo arreglo.length, no que diga 5.0
    if promedio >= c
      puts "#{nombre} está aprobado porque su promedio es igual o mayor a #{c}"
    end
  end
end


continuar = true
while continuar
  puts '....................................'
  puts 'Ingrese una opción'
  puts '1) Promedio de Notas'
  puts '2) Cantidad de inasistencias'
  puts '3) Alumnos aprobados'
  puts '4) Salir'
  puts '....................................'

  opcion = gets.chomp

  #termina código de opción 1

  if opcion.to_i == 1
    file = File.open('notas.csv','r')
    data = file.readlines
    file.close


    data.each do |line|
      arreglo = line.split(', ')
      nombre = arreglo[0]
      promedio = (arreglo[1].to_i + arreglo[2].to_i + arreglo[3].to_i + arreglo[4].to_i + arreglo[5].to_i)/5.0
      #no se encuentra parametrizado ese dato(/5.0)
      escribir_promedio_alumno(nombre, promedio) #metodo para crear archivo con nota y nombre

      end
      puts "Se ha creado un archivo con los Promedios de los Alumnos"
  end

#termina código de opción 1

#comienza código de opción 2
if opcion.to_i == 2
  file = File.open('notas.csv','r')
  data = file.readlines.map(&:chomp)
  file.close
  total_inasistencias = 0

  data.each do |line|
    line.split(', ').each do |word|
      total_inasistencias += 1 if word == 'A'
    end
  end
  p "El total de inasistencias es #{total_inasistencias} // Recuerda que si faltas a una prueba tienes un 0!"
  #será considerado este mensaje!
end
#termina código de opción 2

#termina código de opción 3
if opcion.to_i == 3
mostrar_aprobados(5)

end

#termina código de opción 3
if opcion.to_i == 4
   continuar = false
   p "Hasta Luego!"
 end

end # end del while
