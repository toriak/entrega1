require 'caesar_cipher'

class CifradoCesar

    def cifrar (password)

        caesar = CaesarCipher::Caesar.new
        password_cifrado = caesar.cipher(password.to_s)
        return password_cifrado
    end

    def descifrar(password_cifrado)

        caesar = CaesarCipher::Caesar.new
        password_descifrado = caesar.decipher(password_cifrado)
        return password_descifrado
    end

end