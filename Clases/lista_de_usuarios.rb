require_relative 'usuario.rb'

class ListaDeUsuario

	#este getter solo sirve para el funcionamiento del test de esta clase
	attr_reader :lista_de_usuarios 

	def initialize
		@lista_de_usuarios = []

	end

	def agregar_usuario(nombre_usuario, password)

		resultado = self.existe_nombre_usuario(nombre_usuario)
		if resultado == false
			self.lista_de_usuarios << Usuario.new(nombre_usuario, password)
			return true
		else
			return false
		end
	end

	def buscar(nombre_de_usuario, password)

		self.lista_de_usuarios.each do |usuario_de_lista|
			
			if usuario_de_lista.verificacion_nombre nombre_de_usuario
			
				usuario = usuario_de_lista	

				return usuario.verificacion_password password
			end	

		end

		return false
	end
		
	def existe_nombre_usuario (nombre_de_usuario)
		
		self.lista_de_usuarios.each do |usuario_de_lista|
			
			if usuario_de_lista.verificacion_nombre nombre_de_usuario
				return true
			end
		end
		return false
	end

end