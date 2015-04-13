require_relative 'lista_de_usuarios.rb'

class Controlador

	def initialize

		lista = ListaDeUsuario.new
		
		lista.agregar_usuario Usuario.new "andres" , 1234

	end
end