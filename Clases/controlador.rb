require_relative 'lista_de_usuarios.rb'

class Controlador

	#este mensaje solo es utilizado para el funcionamiento de los test e interaccion con eñ objeto codificador
	#attr_reader :lista

	def initialize
		@lista= ListaDeUsuario.new
		#se crea el usuario base
		self.agregar_usuario("andres", 1234)
	end

	def existe_usuario?(nombre_de_usuario, password)
		return @lista.existe_usuario(nombre_de_usuario, password)
	end
	def existe_nombre_usuario (nombre_de_usuario)
		return @lista.existe_nombre_usuario (nombre_de_usuario)
	end

	def agregar_usuario(nombre_usuario , password)
		return @lista.agregar_usuario(nombre_usuario, password)
	end

	def eliminar_usuario(nombre)
		return @lista.eliminar_usuario(nombre)
	end
	def guardar_cambios(nombre,nombre_usuario, password)
		return @lista.guardar_cambios(nombre,nombre_usuario, password)
	end
	def cifrado_texto_plano
  	return @lista.cifrado_texto_plano
  end
  def cifrado_caesar_cipher
  	return @lista.cifrado_caesar_cipher
  end
  def cifrado_bcrypt
  	return @lista.cifrado_bcrypt
  end
end