require_relative 'usuario.rb'

class ListaDeUsuario

	def initialize
		@lista_de_usuarios = []

	end

	def agregar_usuario (unUsuario)
		
		if unUsuario.class == Usuario
			@lista_de_usuarios << unUsuario
			return true
		else
			return false
		end
	end

	def buscar(nombre_de_usuario, password)

		@lista_de_usuarios.each do |usuario_de_lista|
			
			if usuario_de_lista.verificacion_nombre nombre_de_usuario
			
				usuario = usuario_de_lista	

				return usuario.verificacion_password password
			end	

		end

		return false
	end
	
end