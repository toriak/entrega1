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

end