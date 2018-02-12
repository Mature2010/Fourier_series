# Alfonso Candiani Jaramillo
# Ingenieria en Sistemas Computacionales

class SeriesDeFurier 
	def initialize()
	end
	def main()

# Bucle para realizar n-operaciones

		# Variable ejecucion del Bucle De ejercicio
		repeticion = false

		while repeticion == false

# Arreglos dinamicos utilizados 

		valores_y = []
		valore_menor_x = []
		valore_mayor_x = []
		valor_de_a = []
		valor_de_an = []
		valor_de_bn = []
		valores_y_de_x = []
		valor_de_a0_X = []
		valor_de_X_en_an_parte1 = []
		valor_de_X_en_an_parte2 = []
		valor_de_X_en_bn_parte1 = []
		valor_de_X_en_bn_parte2 = []

# Variables		
		pregunta_valory_x = 0

# Variables Bucle		
		
		i = 0
		j = 0
		l = 0
		m = 0
		n = 0
		z = 0
		k = 0
		o = 0
		q = 0
		r = 0
		a1 = 0

# Variables Sumas para respuestas finales		
	
		sumatoria = 0.0
		sumatoriaan = 0.0
		sumatoriabn = 0.0
		sumatoria0x = 0.0
		sumatoriaan_de_x = 0.0
		sumatoriaan_de_x_parte2 = 0.0
		sumatorianbn_de_x = 0.0
		sumatorian_de_bn_en_x_p2 = 0.0

# Informacion de las especificaciones de la grafica

		puts "Series de Fourier"
		puts "Número de segmentos en la grafica: "
		cantidad = gets.to_i

		puts "¿En la grafica existe un segmento en Y con valor X?"
		puts "1) Si  2) No"
		pregunta_valory_x = gets.to_i

# Llenado de las variables de las funciones segun cuantos segmentos especificara el usuario 

		while i < cantidad
			puts "Introduzca el valor de Y#{i+1}:"
			valores_y[i] = gets.to_f

			if pregunta_valory_x == 1
			puts "Introduzca el valor de X en Y#{i+1}:"
			valores_y_de_x[i] = gets.to_f	
			end

			puts "Introduzca el valor menor de X#{i+1}:"
			valore_menor_x[i] = gets.to_f

			puts "Introduzca el valor mayor de X#{i+1}:"
			valore_mayor_x[i] = gets.to_f

			puts
			i += 1
		end
		
# Algoritmo para eliminar funciones con valores de Y = 0 

		while j < cantidad
			if valores_y[j] == 0
				puts "El valor de F(x)#{j+1} sera eliminado ya que su valor en Y tiende a 0"
				valores_y[j] = nil
				valores_y_de_x[j] = nil
				valore_menor_x[j] = nil
				valore_mayor_x[j] = nil
				cantidad = cantidad - 1
			end
			j += 1 
		end

# Re-acomodo de las posiciones de las variables despues de eliminar funciones con valores iguales a 0 

		valores_y.each{
			|numero|
			if numero != nil 
			valores_y[l] = numero
			l += 1
			end
		}

		valore_menor_x.each{
			|numero2|
			if numero2 != nil
			valore_menor_x[m] = numero2
			m += 1
			end
		}

		valore_mayor_x.each{
			|numero3|
			if numero3 != nil
			valore_mayor_x[n] = numero3
			n += 1
			end
		}

		valores_y_de_x.each{
			|numero4|
			if numero4 != nil
			valores_y_de_x[z] = numero4
			z += 1
			end
		}
# Impresion de las funciones F(x) despues de la depuracion de las funciones con valores de y = 0

	puts " * * * * * * * * * * * * * * * * * * * * * * *VALORES F(X) * * * * * * * * * * * * * * * * * * * * * * * "
	puts
			while k < cantidad
				if pregunta_valory_x == 1
				puts "\tF(x)#{k+1} = #{valores_y[k]} + #{valores_y_de_x[k]}(X)  #{valore_menor_x[k]} <= X < #{valore_mayor_x[k]}"	
				k += 1
				else	
				puts "\tF(x)#{k+1} = #{valores_y[k]}  #{valore_menor_x[k]} <= X < #{valore_mayor_x[k]}"	
				k += 1
				end
			end
	puts
	puts" * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * "

# Algoritmo para llenado de Ao

	while o < cantidad
	valor_de_a[o] = (valores_y[o]*valore_mayor_x[o]) - (valores_y[o]*valore_menor_x[o])	
	o += 1	
	end

	valor_de_a.each{
		|suma|
		sumatoria += suma 
	}
	
	resultado1 = sumatoria/360
	resultado1 = resultado1.round(4)

	puts
	puts "\tConvertir a fraccion ---> A0 = #{resultado1}"

# Algoritmo para obtener An y llenado de las variables seno de la incognita X

	while q < cantidad

		respuesta_sen_menor = Math.sin (valor_menor_x[q] * 2.0 *Math::PI/360)
		respuesta_sen_mayor = Math.sin (valor_mayor_x[q] * 2.0 *Math::PI/360)
		respuesta_sen_menor = respuesta_sen_menor.round(4)
		respuesta_sen_mayor = respuesta_sen_mayor.round(4)

		valor_de_an[q] = ((valores_y[q]*respuesta_sen_mayor) - (valores_y[q]*respuesta_sen_menor))

		# LLenado de los senos de la incognita X

		if pregunta_valory_x == 1 
		valor_de_X_en_an_parte2[q] = respuesta_sen_mayor - respuesta_sen_menor
		valor_de_X_en_an_parte2[q] *= valores_y_de_x[q]
		valor_de_X_en_bn_parte2[q] = respuesta_sen_mayor - respuesta_sen_menor
		valor_de_X_en_bn_parte2[q] *= valores_y_de_x[q]
		end

		q += 1
	end

	valor_de_an.each{
		|sumaan|
		sumatoriaan += sumaan
	}

	puts "\tConvertir a fraccion ---> An = #{sumatoriaan}/πn"

# Algoritmo para obtener Bn ademas llenado de las variables coseno que se utilizan en la incognita X

	while r < cantidad

		if valore_menor_x[r] < 0
		respuesta_cos_menor = Math.cos (valore_menor_x[r]* 2.0 *Math::PI/360.0)
		respuesta_cos_menor *= -1
		else
		respuesta_cos_menor = Math.cos (valore_menor_x[r]* 2.0 *Math::PI/360.0)
		end

		if valore_mayor_x[r] < 0
		respuesta_cos_mayor = Math.cos (valore_mayor_x[r]* 2.0 *Math::PI/360.0)
		respuesta_cos_mayor *= -1
		else
		respuesta_cos_mayor = Math.cos (valore_mayor_x[r]* 2.0 *Math::PI/360.0)
		end	

		respuesta_cos_menor = respuesta_cos_menor.round(4)
		respuesta_cos_mayor = respuesta_cos_mayor.round(4)

		valores_y[r] = valores_y[r]*-1

		valor_de_bn[r] = (valores_y[r]*respuesta_cos_mayor) - (valores_y[r]*respuesta_cos_menor)

		# LLenado de las variables coseno

		if pregunta_valory_x == 1
		valor_de_X_en_an_parte1[r] = respuesta_cos_mayor - respuesta_cos_menor 
		valor_de_X_en_an_parte1[r] *= valores_y_de_x[r]
		respuesta_cos_mayor *= -1
		respuesta_cos_menor *= -1
		valor_de_X_en_bn_parte1[r] = respuesta_cos_mayor - respuesta_cos_menor
		valor_de_X_en_bn_parte1[r] *= valores_y_de_x[r]
		end

		r += 1
	end

	valor_de_bn.each{
		|sumabn|
		sumatoriabn += sumabn
	}

	puts "\tConvertir a fraccion ---> Bn = #{sumatoriabn}/πn "


# Formula para obtener la X en A0 

	if pregunta_valory_x == 1

	while a1 < cantidad
	valore_mayor_x[a1] = valore_mayor_x[a1]**2
	valore_menor_x[a1] = valore_menor_x[a1]**2
	valor_de_a0_X [a1] = ((valores_y_de_x[a1]*valore_mayor_x[a1])/2) - ((valores_y_de_x[a1]*valore_menor_x[a1])/2)	
	a1 += 1	
	end

	valor_de_a0_X.each{
		|suma_de_x|
		sumatoria0x += suma_de_x 
	}
	
	segundo_valor_en_y = sumatoria0x / 360
	segundo_valor_en_y = segundo_valor_en_y.round(4)

	puts
	puts "\tConvertir a πrad ---> A0 X = #{segundo_valor_en_y}º"
	end

# Formula para obtener el valor final de las X en An

	if pregunta_valory_x == 1

	valor_de_X_en_an_parte1.each{
		|sumaan_de_x|
		sumatoriaan_de_x += sumaan_de_x
	}

	valor_de_X_en_an_parte2.each{
		|sumaan_de_x_p2|
		sumatoriaan_de_x_parte2 += sumaan_de_x_p2
	}

	puts
	puts "\tValor de incognitas ---> An de X = #{sumatoriaan_de_x}/πn^2"
	puts "\tValor de incognitas ---> An de X = #{sumatoriaan_de_x_parte2} x/πn"

	end

# Formula para obtener el valor final de las X en Bn

	if pregunta_valory_x == 1

	valor_de_X_en_bn_parte1.each{
		|sumaan_de_x_en_bn|
		sumatorianbn_de_x += sumaan_de_x_en_bn
	}

	valor_de_X_en_bn_parte2.each{
		|sumaan_de_x_en_bn_p2|
		sumatorian_de_bn_en_x_p2 += sumaan_de_x_en_bn_p2
	}

	puts
	puts "\tValor de incognitas ---> Bn de X = #{sumatorian_de_bn_en_x_p2}/πn^2"
	puts "\tValor de incognitas ---> Bn de X = #{sumatorianbn_de_x} x/πn"

	end
# Impresion de todos los valores en la formula de euler con opcion para valores de x o no

	if pregunta_valory_x == 1
	puts
	puts " * * * * * * * * * * * * * * * * * * * * * * *FORMULA DE EULER * * * * * * * * * * * * * * * * * * * * * "
	puts "                      α"
	puts "F(x) = #{resultado1} + #{segundo_valor_en_y}º + Σ [#{sumatoriaan}/πn + #{sumatoriaan_de_x}/πn^2 + #{sumatoriaan_de_x_parte2}x/πn Cos nx + #{sumatoriabn}/πn + #{sumatorian_de_bn_en_x_p2}/πn^2 + #{sumatorianbn_de_x} x/πn Sen nx]"
	puts "                     n=1"
	else
	puts
	puts " * * * * * * * * * * * * * * * * * * * * * * *FORMULA DE EULER * * * * * * * * * * * * * * * * * * * * * "
	puts "               α"
	puts "F(x) = #{resultado1} + Σ [#{sumatoriaan}/πn Cos nx + #{sumatoriabn}/πn Sen nx]"
	puts "              n=1"
	end

# Limpieza de variables

		valores_y.clear
		valore_menor_x.clear
		valore_mayor_x.clear
		valor_de_a.clear
		valor_de_an.clear
		valor_de_bn.clear
		valores_y_de_x.clear
		valor_de_a0_X.clear
		valor_de_X_en_an_parte1.clear
		valor_de_X_en_an_parte2.clear
		valor_de_X_en_bn_parte1.clear
		valor_de_X_en_bn_parte2.clear

# Ciclo de Ejercicios

	puts " - - - - - - - - - - - - - - - - - - - - - Ejercicio terminado - - - - - - -- - - - - - - - - - - - - - "
	puts "¿Desea realizar otro ejercicio?"
	puts "1) Si\t2) No"

	pregunta_final = gets.to_i
	
	if pregunta_final == 2
	repeticion = true
	end

end	
	
	puts "Gracias por Utilizar este programa"

end
end

# Ejecucion del programa

objeto = SeriesDeFurier.new()
objeto.main
gets()
