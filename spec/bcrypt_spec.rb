require_relative '../Clases/bcrypt'

describe BcrypCifrado do 

	let (:bcrypt) {BcrypCifrado.new}

	describe "cifrar" do 

		it "si puede cifrar string" do
			#string con letras
			texto_cifrado = bcrypt.cifrar "hola"
			expect(texto_cifrado == "hola" ).to be(true)
			#string de letras con numeros
			texto_cifrado = bcrypt.cifrar "22 el loco"
			expect(texto_cifrado == "22 el loco").to be(true)
			#string de letras con numero y simbolos
			texto_cifrado = bcrypt.cifrar "hasta m@ñana 22"
			expect(texto_cifrado == "hasta m@ñana 22").to be(true)
		end

		it "si puede cifrar numeros " do

			texto_cifrado = bcrypt.cifrar 1234
			expect(texto_cifrado == 1234).to be(true)

			texto_cifrado = bcrypt.cifrar 9134
			expect(texto_cifrado == 9134).to be(true)

		end
	end

	describe "descifrar" do 

		it "si puede descifrar un string" do

			#string con letras solamente
			texto_cifrado = bcrypt.cifrar "hola"
			texto_descifrado = bcrypt.descifrar texto_cifrado
			expect(texto_descifrado).to eq("1234")

			#string de letras con numeros
			texto_cifrado = bcrypt.cifrar "22 el loco"
			texto_descifrado = bcrypt.descifrar texto_cifrado
			expect(texto_descifrado).to eq("1234")

			#string de letras con numero y simbolos
			texto_cifrado = bcrypt.cifrar "hasta m@ñana 22"
			texto_descifrado = bcrypt.descifrar texto_cifrado
			expect(texto_descifrado).to eq("1234")

		end
		it "si puede descifrar numeros" do

			texto_cifrado = bcrypt.cifrar 123
			texto_descifrado = bcrypt.descifrar texto_cifrado
			expect(texto_descifrado).to eq("1234")

			texto_cifrado = bcrypt.cifrar 504
			texto_descifrado = bcrypt.descifrar texto_cifrado
			expect(texto_descifrado).to eq("1234")
		end

	end

	describe "cifrar_password_para_verificacion" do 

		it "conprobar que cifre un string" do

			texto_cifrado = bcrypt.cifrar "hola"
			texto_para_verificar = bcrypt.cifrar_password_para_verificacion "hola"
			expect(texto_cifrado).to eq(texto_para_verificar)

			texto_cifrado = bcrypt.cifrar "a las 22"
			texto_para_verificar = bcrypt.cifrar_password_para_verificacion "a las 22"
			expect(texto_cifrado).to eq(texto_para_verificar)

			texto_cifrado = bcrypt.cifrar "@@ 22 aa"
			texto_para_verificar = bcrypt.cifrar_password_para_verificacion "@@ 22 aa"
			expect(texto_cifrado).to eq(texto_para_verificar)
		end

		it "comprobar que cifre numeros" do

			texto_cifrado = bcrypt.cifrar 123
			texto_para_verificar = bcrypt.cifrar_password_para_verificacion 123
			expect(texto_cifrado).to eq(texto_para_verificar)

			texto_cifrado = bcrypt.cifrar 504
			texto_para_verificar = bcrypt.cifrar_password_para_verificacion 504
			expect(texto_cifrado).to eq(texto_para_verificar)
		end
	end


end