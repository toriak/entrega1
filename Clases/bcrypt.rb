require 'bcrypt'
require_relative 'codificadores.rb'
require_relative 'texto_plano.rb'
require_relative 'caesar_cipher.rb'

class BcrypCifrado < Codificadores

  def cifrar (password)
   	password_cifrado = BCrypt::Password.create(password.to_s)
   	return password_cifrado
  end

  def cifrar_password_para_verificacion(password)
    return password
  end

  def bcryp(lista_de_usuarios)
    return self
  end

  def cambiar_cifrado(password, codificador_nuevo)
    # como los hast generado por esta clase no pueden ser descifrados
    # al cambiar el codificador bcrypt a otro tipo, se tomo la decicion
    # de dar como password "1234" a todos los usuarios
    return codificador_nuevo.cifrar "1234"
  end
end