require_relative 'usuario.rb'

class ListaDeUsuario

	#este getter solo sirve para el funcionamiento del test de esta clase
	attr_reader :lista_de_usuarios 

	def initialize
		@lista_de_usuarios = []

	end
	# => metodo para agregar un usuario nuevo a la lista
	def agregar_usuario(nombre_usuario, password)

		resultado = self.existe_nombre_usuario(nombre_usuario)
		if resultado == false
			self.lista_de_usuarios << Usuario.new(nombre_usuario, password)
			return true
		else
			return false
		end
	end

	# => este metodo sirve para verificar que un usuario con su respectiva password exista
	def buscar(nombre_de_usuario, password)

		self.lista_de_usuarios.each do |usuario_de_lista|
			
			if usuario_de_lista.verificacion_nombre nombre_de_usuario
			
				usuario = usuario_de_lista	

				return usuario.verificacion_password password
			end	

		end

		return false
	end
	
	# => este metodo se utiliza para verificar que el nombre del usuario a quien se quiere registrar esta disponible, 
	# => es decir que no exista en la lista
	def existe_nombre_usuario (nombre_de_usuario)
		
		self.lista_de_usuarios.each do |usuario_de_lista|
			
			if usuario_de_lista.verificacion_nombre nombre_de_usuario
				return true
			end
		end
		return false
	end

end