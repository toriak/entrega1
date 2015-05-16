class Codificadores

	def cifrar(password)
		return raise NotImplementedError
	end

	def descifrar(password)
		return raise NotImplementedError
	end

	def cifrar_password_para_verificacion(password)
		return raise NotImplementedError
	end

	def cambiar_cifrado(password, codificador_nuevo)
		return raise NotImplementedError
	end

  def texto_plano(lista_de_usuarios)
  	return self.cambiar_tipo_cifrado(lista_de_usuarios, TextoPlano.new)
  end

  def bcryp(lista_de_usuarios)
		return self.cambiar_tipo_cifrado(lista_de_usuarios, BcrypCifrado.new)
  end

  def caesar_cipher(lista_de_usuarios)
  	return self.cambiar_tipo_cifrado(lista_de_usuarios, CifradoCesar.new)
  end


  def cambiar_tipo_cifrado(lista_de_usuarios, codificador_nuevo)
  	lista_de_usuarios.each do |usuario|
			usuario.cambiar_cifrado(self,codificador_nuevo)
		end
		return codificador_nuevo
  end

end