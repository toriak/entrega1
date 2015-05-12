require_relative 'usuario.rb'
require_relative 'texto_plano.rb'
require_relative 'caesar_cipher.rb'
require_relative 'bcrypt.rb'
require_relative 'codificadores.rb'

class ListaDeUsuario

	#este getter solo es utilizados para los test
	attr_reader :codificador

	def initialize
		@lista_de_usuarios = []
		@codificador = CifradoCesar.new
	end

	def agregar_usuario(nombre_usuario, password)
		resultado = self.existe_nombre_usuario(nombre_usuario)
		if not resultado
			password_cifrado = @codificador.cifrar(password)
			@lista_de_usuarios << Usuario.new(nombre_usuario, password_cifrado)
			return true
		else
			return false
		end
	end

	def existe_usuario(nombre_de_usuario, password)
		password_cifrado = @codificador.cifrar_password_para_verificacion (password)
		lista = @lista_de_usuarios.collect {|usuario|
			usuario.verificacion_nombre nombre_de_usuario and
			usuario.verificacion_password password_cifrado
		}
		return lista.include? true
	end

	def existe_nombre_usuario (nombre_de_usuario)
		lista = @lista_de_usuarios.map {|usuario|
			usuario.verificacion_nombre nombre_de_usuario
		}
		return lista.include? true
	end

	def cifrado_texto_plano
		@codificador = @codificador.texto_plano(@lista_de_usuarios)
  end

  def cifrado_caesar_cipher
		@codificador = @codificador.caesar_cipher(@lista_de_usuarios)
  end

  def cifrado_bcrypt
  	@codificador = @codificador.bcryp(@lista_de_usuarios)
  end
end