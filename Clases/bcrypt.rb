require 'bcrypt'

class BcrypCifrado

    def cifrar (password)

    	password_cifrado = BCrypt::Password.create(password.to_s)
    	return password_cifrado
    end
    
    def descifrar(password)
    	# a no poder ser descifrado los has producidos por bcrupt
    	# este metodo devuelve el string "1234" como nueva password
    	password = "1234"
		return password
	end

    def cifrar_password_para_verificacion(password)

        return password
    end
end