require_relative 'lista_de_usuarios.rb'

class TextoPlano

	def cifrar(password)

		return password.to_s
	end

	def descifrar(password)

		return password.to_s
	end

	def cifrar_password_para_verificacion(password)

        return self.cifrar password
    end

end