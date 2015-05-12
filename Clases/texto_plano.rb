require_relative 'codificadores.rb'
require_relative 'caesar_cipher.rb'
require_relative 'bcrypt.rb'

class TextoPlano < Codificadores

	def cifrar(password)
		return password.to_s
	end

	def cifrar_password_para_verificacion(password)
    return self.cifrar password
  end

  def texto_plano(lista_de_usuarios)
  	return self
  end

  def cambiar_cifrado(password, codificador_nuevo)
	return codificador_nuevo.cifrar password
  end
end