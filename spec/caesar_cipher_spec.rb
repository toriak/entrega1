require_relative '../Clases/caesar_cipher'

describe CifradoCesar do 

	let (:caesar_cioher) {CifradoCesar.new}

	describe "cifrar" do 

		it "si puede cifrar string" do
			#string con letras
			texto_cifrado = caesar_cioher.cifrar "hola"
			expect(texto_cifrado == "lspe").to be(true)
			#string de letras con numeros
			texto_cifrado = caesar_cioher.cifrar "22 el loco"
			expect(texto_cifrado == "22 ip psgs").to be(true)
			#string de letras con numero y simbolos
			texto_cifrado = caesar_cioher.cifrar "hasta m@ñana 22"
			expect(texto_cifrado == "lewxe q@ñere 22").to be(true)
		end

		it "si puede cifrar numeros " do

			texto_cifrado = caesar_cioher.cifrar 1234
			expect(texto_cifrado == "1234").to be(true)

			texto_cifrado = caesar_cioher.cifrar 9134
			expect(texto_cifrado == "9134").to be(true)

		end
	end

end