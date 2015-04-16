require_relative '../Clases/controlador.rb'
require_relative '../Clases/lista_de_usuarios.rb'

describe Controlador do

	before(:example) do

		@controlador = Controlador.new
	end

	describe "initialize" do
		it "si al ejecutarce crea correctamente la variable lista_de_usuarios" do
			lista_del_controlador = @controlador.lista
			expect(lista_del_controlador.class).to be(ListaDeUsuario)
		end
		it "cambiar los nombres de los metodos que debuelven un buleano 
		y agregarle un '?' al final (es convencion)"
	end

	describe "existe_usuario" do
		
		it "si encuentra al usuario base" do
			#el controlador posee un usuario base llamado andres y con password 1234
			expect(@controlador.existe_usuario("andres", 1234)).to be(true)
		end	

		it "si encuentra a un usuario recien agregado" do
			@controlador.agregar_usuario("pedro", 999)
			expect(@controlador.existe_usuario("pedro", 999)).to be(true)
		end

		it "si encuentra a un usuario que no existe" do

			expect(@controlador.existe_usuario"jorje",146).to be(false)
		end
	end

	describe "agregar_usuario" do

		it "si se agrega correctamente un usuario" do

			expect(@controlador.agregar_usuario"monolo", 1634).to be(true)
		end

		it "si se agrega un usuario con numeros en el nombre y letras en la password" do
			expect(@controlador.agregar_usuario(1234, "monolo")).to be(true)
		end

	end	
end