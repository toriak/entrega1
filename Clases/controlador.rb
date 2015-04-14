require_relative 'lista_de_usuarios.rb'
#require_relative 'texto_plano.rb'

class Controlador

	attr_reader :lista #este mensaje solo es utilizado para el funcionamiento de los test

	def initialize

		@lista= ListaDeUsuario.new
		self.agregar("andres", 1234)
		#codificado = TextoPlano.new
	end

	def buscar(nombre_de_usuario, password)

		return self.lista.buscar nombre_de_usuario, password
	end

	def agregar (nombre_usuario , password)

		#usuario_nuevo = Usuario.new nombre_usuario , password
		return self.lista.agregar_usuario(nombre_usuario, password)
	end

end