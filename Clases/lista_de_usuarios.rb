require_relative 'usuario.rb'
require_relative 'texto_plano.rb'
require_relative 'caesar_cipher.rb'
require_relative 'bcrypt.rb'

class ListaDeUsuario

	def initialize
		@lista_de_usuarios = []
		@codificador = TextoPlano.new
		#@codificador = CifradoCesar.new
		#@codificador = BcrypCifrado.new

	end
	# => metodo para agregar un usuario nuevo a la lista
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

	# => este metodo sirve para verificar que un usuario con su respectiva password exista
	def existe_usuario(nombre_de_usuario, password)

		@lista_de_usuarios.each do |usuario_de_lista|

			if usuario_de_lista.verificacion_nombre nombre_de_usuario

				password_cifrado = @codificador.cifrar_password_para_verificacion (password)

				return usuario_de_lista.verificacion_password password_cifrado
			end
		end

		return false
	end

	# => este metodo se utiliza para verificar que el nombre del usuario a quien se quiere registrar esta disponible, 
	# => es decir que no exista en la lista
	def existe_nombre_usuario (nombre_de_usuario)

		@lista_de_usuarios.each do |usuario_de_lista|

			if usuario_de_lista.verificacion_nombre nombre_de_usuario
				return true
			end
		end
		return false
	end

end