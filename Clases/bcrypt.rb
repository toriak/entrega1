require_relative 'codificadores.rb'
require 'bcrypt'


class BcrypCifrado < Codificadores

  def cifrar (password)
   	password_cifrado = BCrypt::Password.create(password.to_s)
   	return password_cifrado
  end

  def descifrar(password)
    	# a no poder ser descifrado los hast producidos por bcrypt
    	# este metodo devuelve el string "1234" como nueva password
   	password = "1234"
		return password
	end

  def cifrar_password_para_verificacion(password)
    return password
  end

  def bcryp(lista_de_usuarios)
    return self
  end
end