require_relative 'lista_de_usuarios.rb'

class Controlador

	#este mensaje solo es utilizado para el funcionamiento de los test
	attr_reader :lista

	def initialize

		@lista = ListaDeUsuario.new
		
		@lista.agregar_usuario Usuario.new "andres" , 1234

	end

	def buscar(nombre_de_usuario, password)

		return @lista.buscar nombre_de_usuario, password
	end

	def agregar (nombre_usuario , contraseña_usuario)

		usuario_nuevo = Usuario.new nombre_usuario , contraseña_usuario
		return @lista.agregar_usuario usuario_nuevo
	end

end