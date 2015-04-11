require_relative 'usuario.rb'

class ListaDeUsuario

	def initialize
		@lista_de_usuarios = []

		@lista_de_usuarios << usuario.new("andres",1234)
	end

	def buscar(nombre_de_usuario, contraseña)

		@lista_de_usuarios.each do |usuario_de_lista|
			
			if usuario_de_lista.nombre_de_usuario = nombre_de_usuario
			
				usuario = usuario_de_lista	

				return usuario.contraseña = contraseña
			end	

		end

		return false
	end
	
end