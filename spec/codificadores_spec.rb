require_relative '../Clases/codificadores.rb'
require_relative '../Clases/lista_de_usuarios.rb'
require_relative '../Clases/usuario'
require_relative '../Clases/texto_plano.rb'
require_relative '../Clases/caesar_cipher.rb'
require_relative '../Clases/bcrypt.rb'

describe Codificadores do

	let (:codificador_caesar_cipher) {CifradoCesar.new}
	let (:codificador_bcrypt) {BcrypCifrado.new}
	let (:codificador_texto_plano) {TextoPlano.new}

	def inizializar_lista
		lista = ListaDeUsuario.new
		lista.agregar_usuario("raul","asdf")
		lista.agregar_usuario("marco",1234)
		lista.agregar_usuario("tato","1q2w3e")
		return lista
	end
	def inizializar_listado
		lista = []
		lista << Usuario.new("raul","asdf")
		lista << Usuario.new("marco","1234")
		lista << Usuario.new("tato","1q2w3e")
		return lista
	end

	describe "texto_plano" do
		it "si el resultado es el esperado" do
			lista = inizializar_listado

			codificador_resultado = codificador_texto_plano.texto_plano (lista)
			# resusltado = el codificador_resultado y el codificador_texto_plano deben ser el mismo
			expect(codificador_resultado).to be(codificador_texto_plano)
			expect(codificador_resultado == codificador_texto_plano).to be(true)

			# en ambos casos el codificador_resultado debe ser distindo al primer codificador
			lista = inizializar_listado
			codificador_resultado = codificador_caesar_cipher.texto_plano (lista)
			expect(codificador_resultado == codificador_caesar_cipher).to be(false)

			lista = inizializar_listado
			codificador_resultado = codificador_bcrypt.texto_plano (lista)
			expect(codificador_resultado == codificador_bcrypt).to be(false)
		end

	end

end