require_relative '../Clases/usuario'
require_relative '../Clases/texto_plano.rb'
require_relative '../Clases/caesar_cipher.rb'
require_relative '../Clases/bcrypt.rb'

describe Usuario do


	describe "initialize" do

		it "crea correcta de un usuario" do

			usuario = Usuario.new "raul", 22
			expect(usuario.verificacion_nombre"raul")
			expect(usuario.verificacion_password 22)

		end

		it "crea correcta de un usuario que en su nombre contenga una ñ " do

			usuario = Usuario.new "ñoño", "lucas"

			expect(usuario.verificacion_nombre "ñoño")
			expect(usuario.verificacion_password "lucas")

		end
	end

	describe "verificacion_password" do

		usuario = Usuario.new "lucas" , 33
		it "retorna true cuando la password es la correcta" do
			expect(usuario.verificacion_password 33)
		end

		it "retorna false cuando la password es incorrecta" do
			expect(usuario.verificacion_password 323)
		end
	end

	describe "verificacion_nombre" do
		usuario = Usuario.new "jorje" , 42

		it "retorna true cuando el nombre es el correcto" do
			expect(usuario.verificacion_nombre "jorje")
		end

		it "retorna false cuando el nombre es incorrecto" do
			expect(usuario.verificacion_nombre "manuela")
		end

	end

	describe "cambiar_cifrado" do

		####### partiendo de BCRYPT a otro codificador #######

		it "entre bcrypt a bcrypt" do

			codificador = BcrypCifrado.new
			password = "3456"
			password_cifrado = codificador.cifrar(password)
			usuario = Usuario.new("jorje", password_cifrado)
			usuario.cambiar_cifrado(codificador, codificador)

			expect(usuario.verificacion_password "1234")
		end
		it "entre bcrypt a texto plano" do

			codificador = BcrypCifrado.new
			codificador_nuevo = TextoPlano.new

			password = "3456"
			password_cifrado = codificador.cifrar(password)
			usuario = Usuario.new("jorje", password_cifrado)

			usuario.cambiar_cifrado(codificador, codificador_nuevo)

			expect(usuario.verificacion_password "1234")
		end
		it "entre bcrypt a caesar cipher" do

			codificador = BcrypCifrado.new
			codificador_nuevo = CifradoCesar.new

			password = "3456"
			password_cifrado = codificador.cifrar(password)
			usuario = Usuario.new("jorje", password_cifrado)

			usuario.cambiar_cifrado(codificador, codificador_nuevo)

			expect(usuario.verificacion_password "1234")
		end

		####### partiendo de TEXTO PLANO a otro codificador #######

		it "entre Texto Plano a bcrypt" do

			codificador = TextoPlano.new
			codificador_nuevo = BcrypCifrado.new

			password = "3456"
			password_cifrado = codificador.cifrar(password)
			usuario = Usuario.new("jorje", password_cifrado)

			usuario.cambiar_cifrado(codificador, codificador_nuevo)
			password_para_verificar = codificador_nuevo.cifrar_password_para_verificacion password
			expect(usuario.verificacion_password password_para_verificar)
		end

		it "entre Texto Plano a texto plano" do

			codificador = TextoPlano.new
			codificador_nuevo = TextoPlano.new

			password = "3456"
			password_cifrado = codificador.cifrar(password)
			usuario = Usuario.new("jorje", password_cifrado)

			usuario.cambiar_cifrado(codificador, codificador_nuevo)
			password_para_verificar = codificador_nuevo.cifrar_password_para_verificacion password
			expect(usuario.verificacion_password password_para_verificar)
		end

		it "entre Texto Plano a cifrado cesar" do

			codificador = TextoPlano.new
			codificador_nuevo = CifradoCesar.new

			password = "3456"
			password_cifrado = codificador.cifrar(password)
			usuario = Usuario.new("jorje", password_cifrado)

			usuario.cambiar_cifrado(codificador, codificador_nuevo)
			password_para_verificar = codificador_nuevo.cifrar_password_para_verificacion password
			expect(usuario.verificacion_password password_para_verificar)
		end

		####### partiendo de Caesar Cipher a otro codificador #######

		it "entre Caesar Cipher a bcrypt" do

			codificador = CifradoCesar.new
			codificador_nuevo = BcrypCifrado.new

			password = "asd56"
			password_cifrado = codificador.cifrar(password)
			usuario = Usuario.new("jorje", password_cifrado)

			usuario.cambiar_cifrado(codificador, codificador_nuevo)
			password_para_verificar = codificador_nuevo.cifrar_password_para_verificacion password
			expect(usuario.verificacion_password password_para_verificar)
		end
		it "entre Caesar Cipher a texto plano" do

			codificador = CifradoCesar.new
			codificador_nuevo = TextoPlano.new

			password = "asd56"
			password_cifrado = codificador.cifrar(password)
			usuario = Usuario.new("jorje", password_cifrado)

			usuario.cambiar_cifrado(codificador, codificador_nuevo)
			password_para_verificar = codificador_nuevo.cifrar_password_para_verificacion password
			expect(usuario.verificacion_password password_para_verificar)
		end
		it "entre Caesar Cipher a caesar cipher" do

			codificador = CifradoCesar.new
			codificador_nuevo = CifradoCesar.new

			password = "asd56"
			password_cifrado = codificador.cifrar(password)
			usuario = Usuario.new("jorje", password_cifrado)

			usuario.cambiar_cifrado(codificador, codificador_nuevo)
			password_para_verificar = codificador_nuevo.cifrar_password_para_verificacion password
			expect(usuario.verificacion_password password_para_verificar)
		end
	end
end