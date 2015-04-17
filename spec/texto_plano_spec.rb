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
			expect(texto_cifrado == "1234").to be(true)

			texto_cifrado = texto_plano.cifrar 9134
			expect(texto_cifrado == "9134").to be(true)

		end
	end

	describe "descifrar" do 

		it "si puede descifrar un string" do

			#string con letras solamente
			texto_cifrado = texto_plano.cifrar "hola"
			texto_descifrado = texto_plano.descifrar texto_cifrado
			expect(texto_descifrado).to eq("hola")

			#string de letras con numeros
			texto_cifrado = texto_plano.cifrar "22 el loco"
			texto_descifrado = texto_plano.descifrar texto_cifrado
			expect(texto_descifrado).to eq("22 el loco")

			#string de letras con numero y simbolos
			texto_cifrado = texto_plano.cifrar "hasta m@ñana 22"
			texto_descifrado = texto_plano.descifrar texto_cifrado
			expect(texto_descifrado).to eq("hasta m@ñana 22")

		end
		it "si puede descifrar numeros" do

			texto_cifrado = texto_plano.cifrar 123
			texto_descifrado = texto_plano.descifrar texto_cifrado
			expect(texto_descifrado).to eq("123")

			texto_cifrado = texto_plano.cifrar 504
			texto_descifrado = texto_plano.descifrar texto_cifrado
			expect(texto_descifrado).to eq("504")
		end

	end

	describe "cifrar_password_para_verificacion" do 

		it "conprobar que cifre un string" do

			texto_cifrado = texto_plano.cifrar "hola"
			texto_para_verificar = texto_plano.cifrar_password_para_verificacion "hola"
			expect(texto_cifrado).to eq(texto_para_verificar)

			texto_cifrado = texto_plano.cifrar "a las 22"
			texto_para_verificar = texto_plano.cifrar_password_para_verificacion "a las 22"
			expect(texto_cifrado).to eq(texto_para_verificar)

			texto_cifrado = texto_plano.cifrar "@@ 22 aa"
			texto_para_verificar = texto_plano.cifrar_password_para_verificacion "@@ 22 aa"
			expect(texto_cifrado).to eq(texto_para_verificar)
		end

		it "comprobar que cifre numeros" do

			texto_cifrado = texto_plano.cifrar 123
			texto_para_verificar = texto_plano.cifrar_password_para_verificacion 123
			expect(texto_cifrado).to eq(texto_para_verificar)

			texto_cifrado = texto_plano.cifrar 504
			texto_para_verificar = texto_plano.cifrar_password_para_verificacion 504
			expect(texto_cifrado).to eq(texto_para_verificar)
		end
	end
	
end