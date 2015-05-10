require_relative '../Clases/lista_de_usuarios.rb'
require_relative '../Clases/texto_plano.rb'
require_relative '../Clases/caesar_cipher.rb'
require_relative '../Clases/bcrypt.rb'

describe ListaDeUsuario do

	let (:lista) {ListaDeUsuario.new}

	#before(:example) do
    #	@lista = ListaDeUsuario.new
  	#end

	describe "agregar_usuario" do

		it "agrega un Usuario nuevo" do

			lista.agregar_usuario("raul", 22)

			expect(lista.existe_usuario "raul",22).to be(true)
		end
	end

	describe "existe_usuario" do

		it "encuentra a un usuario que esta en la lista" do
			lista.agregar_usuario("Mauro" , 22)
			resultado = lista.existe_usuario"Mauro" ,22
			expect(resultado).to be(true)
		end

		it "encuentra a un usuario que no esta en la lista" do
			resultado = lista.existe_usuario"Jose" ,1234
			expect(resultado).to be(false)
		end
	end

	describe "existe_nombre_usuario" do

		it "encuentra el nombre de un usuario que esta en la lista" do
			lista.agregar_usuario("Mauro" , 22)
			expect(lista.existe_nombre_usuario"Mauro")
		end

		it "encuentra a un usuario que no esta en la lista" do
			resultado = lista.existe_nombre_usuario"Jose"
			expect(resultado).to be(false)
		end
	end

	describe "cifrado_texto_plano" do

		it "que cambie el tipo de codificador a texto plano desde texto plano" do
			lista.agregar_usuario("raul", 22)
			lista.cifrado_texto_plano
			expect(lista.existe_usuario "raul",22)
		end
	end

	describe "cifrado_caesar_cipher" do

		it "que cambie el tipo de codificador a cifrado_caesar_cipher desde texto plano" do
			lista.agregar_usuario("raul", 22)
			lista.cifrado_caesar_cipher
			expect(lista.existe_usuario "raul",22)
		end
	end

	describe "cifrado_bcrypt" do

		it "que cambie el tipo de codificador a cifrado_bcrypt desde texto plano" do
			lista.agregar_usuario("raul", 22)
			lista.cifrado_bcrypt
			expect(lista.existe_usuario "raul",22)
		end
	end
end