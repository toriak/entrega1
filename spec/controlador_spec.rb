require_relative '../Clases/controlador.rb'
require_relative '../Clases/lista_de_usuarios.rb'

describe Controlador do

	before(:example) do
		@controlador = Controlador.new
	end

	describe "initialize" do
		it "si al ejecutarce crea correctamente el usuario base" do
			expect(@controlador.existe_usuario?("andres", 1234))
		end
	end

	describe "existe_usuario?" do
		it "si encuentra al usuario base" do
			#el controlador posee un usuario base llamado andres y con password 1234
			expect(@controlador.existe_usuario?("andres", 1234))
		end
		it "si encuentra a un usuario recien agregado" do
			@controlador.agregar_usuario("pedro", 999)
			expect(@controlador.existe_usuario?("pedro", 999))
		end
		it "si encuentra a un usuario que no existe" do
			expect(@controlador.existe_usuario?"jorje",146).to be(false)
		end
	end

	describe "agregar_usuario" do
		it "si se agrega correctamente un usuario" do
			expect(@controlador.agregar_usuario"manolo", 1634)
		end
		it "si se agrega un usuario con numeros en el nombre y letras en la password" do
			expect(@controlador.agregar_usuario(1234, "manolo"))
		end
	end

	describe "eliminar_usuario" do
		it "si devuelve true y elimina al usuario" do
			@controlador.agregar_usuario("manolo", 1634)
			expect(@controlador.existe_usuario?("manolo", 1634)).to be(true)
			resultado = @controlador.eliminar_usuario "manolo"
			expect(resultado).to be(true)
		end
		it "si devuelve false al tratar de eliminar un usuario no existente" do
			expect(@controlador.eliminar_usuario "manolo").to be(false)
		end
	end

	describe "guardar_cambios" do
		it "si devuelve true al guardar los cambios de un usuario existente" do
			@controlador.agregar_usuario("manolo", 1634)
			expect(@controlador.existe_usuario?("manolo", 1634)).to be(true)
			resultado = @controlador.guardar_cambios("manolo","tato", 1234)
			expect(resultado).to be(true)
			expect(@controlador.existe_usuario?("manolo", 1634)).to be(false)
			expect(@controlador.existe_usuario?("tato", 1234)).to be(true)
		end
		it "si devuelve false al tratar de guardar los cambios en un usuario inexistente" do
			resultado = @controlador.guardar_cambios("manolo","tato", 1234)
			expect(resultado).to be(false)
		end
	end

	describe "test_integral_del_modelo" do
		it "para saber si funciona correctamente el cambio de cifrado con el usuario base" do
			expect(@controlador.existe_usuario?("andres",1234)).to be(true)
			@controlador.cifrado_texto_plano
			expect(@controlador.existe_usuario?("andres",1234)).to be(true)
			@controlador.cifrado_caesar_cipher
			expect(@controlador.existe_usuario?("andres",1234)).to be(true)
			@controlador.cifrado_bcrypt
			expect(@controlador.existe_usuario?("andres",1234)).to be(true)
		end
		it "si funciona bien con un usuario agregado" do
			nombre = "raul"
			password = "asdf"
			@controlador.agregar_usuario("raul","asdf")
			expect(@controlador.existe_usuario?("raul","asdf")).to be(true)
			@controlador.cifrado_texto_plano
			expect(@controlador.existe_usuario?("raul","asdf")).to be(true)
			@controlador.cifrado_caesar_cipher
			expect(@controlador.existe_usuario?(nombre,password)).to be(true)
			@controlador.cifrado_bcrypt
			expect(@controlador.existe_usuario?(nombre,password)).to be(true)
			#al salir del cifrado bcrypt como este no puede ser descifrado
			#se reemplaza la password original por la password base 1234
			@controlador.cifrado_caesar_cipher
			expect(@controlador.existe_usuario?(nombre,"1234"))
			@controlador.cifrado_texto_plano
			expect(@controlador.existe_usuario?(nombre,"1234"))
		end
	end
end