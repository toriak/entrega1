require 'bcrypt'

class BcrypCifrado

    def cifrar (password)

    	password_cifrado = BCrypt::Password.create(password)
    	return password_cifrado
    end

    def cifrar_password_para_verificacion(password)

        return password
    end
end