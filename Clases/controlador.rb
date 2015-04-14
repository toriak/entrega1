require_relative 'lista_de_usuarios.rb'
require_relative 'texto_plano.rb'

class Controlador

	#este mensaje solo es utilizado para el funcionamiento de los test e interaccion con eñ objeto codificador
	attr_reader :lista 
	attr_reader :codificador
	def initialize

		@codificador = TextoPlano.new
		@lista= ListaDeUsuario.new
		self.agregar("andres", 1234)
	end

	def buscar(nombre_de_usuario, password)
	
		return self.codificador.buscar(nombre_de_usuario, password, self.lista) 
		#return self.lista.buscar nombre_de_usuario, password
	end

	def agregar(nombre_usuario , password)

		return self.codificador.agregar(nombre_usuario, password, self.lista)
		#return self.lista.agregar_usuario(nombre_usuario, password)
	end

end