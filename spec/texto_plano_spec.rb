require_relative '../Clases/texto_plano'

describe TextoPlano do

	let (:texto_plano) {TextoPlano.new}

	describe "cifrar" do 

		it "si puede cifrar string" do
			#string con letras
			texto_cifrado = texto_plano.cifrar "hola"
			expect(texto_cifrado == "hola").to be(true)
			#string de letras con numeros
			texto_cifrado = texto_plano.cifrar "22 el loco"
			expect(texto_cifrado == "22 el loco").to be(true)
			#string de letras con numero y simbolos
			texto_cifrado = texto_plano.cifrar "hasta m@ñana 22"
			expect(texto_cifrado == "hasta m@ñana 22").to be(true)
		end

		it "si puede cifrar numeros " do

			texto_cifrado = texto_plano.cifrar 1234
			expect(texto_cifrado == 1234).to be(true)

			texto_cifrado = texto_plano.cifrar 9134
			expect(texto_cifrado == 9134).to be(true)

		end
	end

	describe "descifrar" do 

		it "si puede descifrar un string"
		it "si puede descifrar numeros y simbolos"
		it "si puede descifrar string , numeros y simbolos"
	end

	describe "cifrar_password_para_verificacion" do 

		it "conprobar que cifre un string"
		it "comprobar que cifre numeros y simbolos"
		it "comprobar que cifre string , numeros y simbolos"
	end
	
end