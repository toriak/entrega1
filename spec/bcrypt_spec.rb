require_relative '../Clases/bcrypt'

describe BcrypCifrado do

	let (:bcrypt) {BcrypCifrado.new}

	describe "cifrar" do

		it "si puede cifrar string" do
			#string con letras
			texto = "hola"
			texto_cifrado = bcrypt.cifrar texto
			texto_para_verificar = bcrypt.cifrar_password_para_verificacion texto
			expect(texto_cifrado == texto_para_verificar)
			#string de letras con numeros
			texto = "22 el loco"
			texto_cifrado = bcrypt.cifrar texto
			texto_para_verificar = bcrypt.cifrar_password_para_verificacion texto
			expect(texto_cifrado == texto_para_verificar)
			#string de letras con numero y simbolos
			texto = "hasta m@ñana 22"
			texto_cifrado = bcrypt.cifrar texto
			texto_para_verificar = bcrypt.cifrar_password_para_verificacion texto
			expect(texto_cifrado == texto_para_verificar)
		end

		it "si puede cifrar numeros " do

			texto = 1234
			texto_cifrado = bcrypt.cifrar texto
			texto_para_verificar = bcrypt.cifrar_password_para_verificacion texto
			expect(texto_cifrado == texto_para_verificar)

			texto = 9134
			texto_cifrado = bcrypt.cifrar texto
			texto_para_verificar = bcrypt.cifrar_password_para_verificacion texto
			expect(texto_cifrado == texto_para_verificar)

		end
	end

	describe "cifrar_password_para_verificacion" do

		it "conprobar que cifre un string" do

			texto = "hola"
			texto_cifrado = bcrypt.cifrar texto
			texto_para_verificar = bcrypt.cifrar_password_para_verificacion texto
			expect(texto_cifrado == texto_para_verificar)

			texto = "a las 22"
			texto_cifrado = bcrypt.cifrar texto
			texto_para_verificar = bcrypt.cifrar_password_para_verificacion texto
			expect(texto_cifrado == texto_para_verificar)

			texto = "@@ 22 aa"
			texto_cifrado = bcrypt.cifrar  texto
			texto_para_verificar = bcrypt.cifrar_password_para_verificacion  texto
			expect(texto_cifrado == texto_para_verificar)
		end

		it "comprobar que cifre numeros" do
			texto = 123
			texto_cifrado = bcrypt.cifrar texto
			texto_para_verificar = bcrypt.cifrar_password_para_verificacion texto
			expect(texto_cifrado).to eq(texto_para_verificar)

			texto = 504
			texto_cifrado = bcrypt.cifrar texto
			texto_para_verificar = bcrypt.cifrar_password_para_verificacion texto
			expect(texto_cifrado).to eq(texto_para_verificar)
		end
	end
end