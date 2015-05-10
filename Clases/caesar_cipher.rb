require 'caesar_cipher'

class CifradoCesar

    # esta clase puede codificar solo las letras pero no los numeros y los simbolos
    # esto no quita que el string a codificar no pueda tener numeros o simbolos

    def initialize
        @caesar = CaesarCipher::Caesar.new
    end
    def cifrar (password)

        password_cifrado = @caesar.cipher(password.to_s)
        return password_cifrado
    end

    def descifrar(password_cifrado)

        password_descifrado = @caesar.decipher(password_cifrado)
        return password_descifrado
    end

    def cifrar_password_para_verificacion(password)

        return self.cifrar password
    end

end