require_relative '../Clases/caesar_cipher'

describe CifradoCesar do

	let (:caesar_cipher) {CifradoCesar.new}

	describe "cifrar" do

		it "si puede cifrar string" do
			#string con letras
			texto_cifrado = caesar_cipher.cifrar "hola"
			expect(texto_cifrado == "lspe").to be(true)
			#string de letras y numeros
			texto_cifrado = caesar_cipher.cifrar "22 el loco"
			expect(texto_cifrado == "22 ip psgs").to be(true)
			#string de letras, numero y simbolos
			texto_cifrado = caesar_cipher.cifrar "hasta m@ñana 22"
			expect(texto_cifrado == "lewxe q@ñere 22").to be(true)
		end

		it "no cifra numeros " do

			texto_cifrado = caesar_cipher.cifrar 1234
			expect(texto_cifrado == "1234").to be(true)

			texto_cifrado = caesar_cipher.cifrar 9134
			expect(texto_cifrado == "9134").to be(true)

		end
	end

	describe "cifrar_password_para_verificacion" do

		it "conprobar que cifre un string" do

			texto_cifrado = caesar_cipher.cifrar "hola"
			texto_para_verificar = caesar_cipher.cifrar_password_para_verificacion "hola"
			expect(texto_cifrado).to eq(texto_para_verificar)

			texto_cifrado = caesar_cipher.cifrar "a las 22"
			texto_para_verificar = caesar_cipher.cifrar_password_para_verificacion "a las 22"
			expect(texto_cifrado).to eq(texto_para_verificar)

			texto_cifrado = caesar_cipher.cifrar "@@ 22 aa"
			texto_para_verificar = caesar_cipher.cifrar_password_para_verificacion "@@ 22 aa"
			expect(texto_cifrado).to eq(texto_para_verificar)
		end

		it "comprobar que no cifra numeros" do

			texto_cifrado = caesar_cipher.cifrar 123
			texto_para_verificar = caesar_cipher.cifrar_password_para_verificacion 123
			expect(texto_cifrado).to eq(texto_para_verificar)

			texto_cifrado = caesar_cipher.cifrar 504
			texto_para_verificar = caesar_cipher.cifrar_password_para_verificacion 504
			expect(texto_cifrado).to eq(texto_para_verificar)
		end
	end

	describe "descifrar" do

		it "si puede descifrar un string" do
			#string con letras solamente
			texto_cifrado = caesar_cipher.cifrar "hola"
			texto_descifrado = caesar_cipher.descifrar texto_cifrado
			expect(texto_descifrado).to eq("hola")

			#string de letras con numeros
			texto_cifrado = caesar_cipher.cifrar "22 el loco"
			texto_descifrado = caesar_cipher.descifrar texto_cifrado
			expect(texto_descifrado).to eq("22 el loco")

			#string de letras con numero y simbolos
			texto_cifrado = caesar_cipher.cifrar "hasta m@ñana 22"
			texto_descifrado = caesar_cipher.descifrar texto_cifrado
			expect(texto_descifrado).to eq("hasta m@ñana 22")

		end
		it "si puede descifrar numeros" do

			texto_cifrado = caesar_cipher.cifrar 123
			texto_descifrado = caesar_cipher.descifrar texto_cifrado
			expect(texto_descifrado).to eq("123")

			texto_cifrado = caesar_cipher.cifrar 504
			texto_descifrado = caesar_cipher.descifrar texto_cifrado
			expect(texto_descifrado).to eq("504")
		end

	end

end