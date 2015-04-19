require_relative 'usuario.rb'
require_relative 'texto_plano.rb'
require_relative 'caesar_cipher.rb'
require_relative 'bcrypt.rb'

class ListaDeUsuario

	#este getter solo es utilizados para los test
	attr_reader :codificador

	def initialize
		@lista_de_usuarios = []
		self.cifrado_texto_plano

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

	################### Metodos para cambio de tipo de cifrado ############################
	def cifrado_texto_plano

		clase_codificador = @codificador.class
		if  clase_codificador == TextoPlano
			return true
		else
			return self.cambio_cifrado_estructura(TextoPlano.new)
    	end
    end

    def cifrado_caesar_cipher

    	clase_codificador = @codificador.class
		if  clase_codificador == CifradoCesar
			return true
		else
			return self.cambio_cifrado_estructura(CifradoCesar.new)
    	end
   	end

   	def cifrado_bcrypt

   		clase_codificador = @codificador.class
		if  clase_codificador == BcrypCifrado
			return true
		else
			return self.cambio_cifrado_estructura(BcrypCifrado.new)
    	end
   	end

   	##### estructuras para poder llevar a cabo el cambio de tipo de cifrado #####
   	def cambio_cifrado_estructura(codificado_nuevo)

   		clase_cifrador = @codificador.class
		if clase_cifrador == BcrypCifrado
			cambio_cifrado(codificado_nuevo)
			return false
		else
			cambio_cifrado(codificado_nuevo)
			return true
		end
   	end

   	def cambio_cifrado(codificado_nuevo)
   		@lista_de_usuarios.each do |usuario_de_lista|
			usuario_de_lista.cambiar_cifrado(@codificador,codificado_nuevo)
		end
		@codificador = codificado_nuevo
   	end
end