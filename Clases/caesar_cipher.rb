require 'caesar_cipher'
require_relative 'texto_plano.rb'
require_relative 'bcrypt.rb'
require_relative 'codificadores.rb'

class CifradoCesar < Codificadores
    # esta clase puede codificar solo las letras, pero NO codifica numeros ni simbolos
    # esto no quita que el string a codificar no pueda tener numeros o simbolos

  def initialize
    @caesar = CaesarCipher::Caesar.new
  end

  def cifrar (password)
    password_cifrado = @caesar.cipher(password.to_s)
    return password_cifrado
  end

  def cifrar_password_para_verificacion(password)
    return self.cifrar password
  end

  def caesar_cipher(lista_de_usuarios)
    return self
  end

  def cambiar_cifrado(password, codificador_nuevo)
  password_descifrado = @caesar.decipher(password)
  return codificador_nuevo.cifrar password_descifrado
  end
end