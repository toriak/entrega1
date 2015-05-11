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
		#self.cifrado_texto_plano
		@codificador = CifradoCesar.new
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
		password_cifrado = @codificador.cifrar_password_para_verificacion (password)
		lista = @lista_de_usuarios.collect {|usuario|
			usuario.verificacion_nombre nombre_de_usuario and
			usuario.verificacion_password password_cifrado
		}
		return lista.include? true
	end

	# => este metodo se utiliza para verificar que el nombre del usuario a quien se quiere registrar esta disponible, 
	# => es decir que no exista en la lista
	def existe_nombre_usuario (nombre_de_usuario)
		lista = @lista_de_usuarios.collect {|usuario|
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

=begin
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
=end

end