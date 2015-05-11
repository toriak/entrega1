require_relative 'codificadores.rb'

class TextoPlano < Codificadores

	def cifrar(password)
		return password.to_s
	end

	def descifrar(password)
		return password.to_s
	end

	def cifrar_password_para_verificacion(password)
    return self.cifrar password
  end

  def texto_plano(lista_de_usuarios)
  	return self
  end

end