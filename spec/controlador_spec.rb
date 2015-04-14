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
	end

	describe "buscar" do
		
		it "si encuentra al usuario base" do
			#el controlador posee un usuario base llamado andres y con password 1234
			expect(@controlador.buscar("andres", 1234)).to be(true)
		end	

		it "si encuentra a un usuario recien agregado" do
			@controlador.agregar("pedro", 999)
			expect(@controlador.buscar("pedro", 999)).to be(true)
		end

		it "si encuentra a un usuario que no existe" do

			expect(@controlador.buscar"jorje",146).to be(false)
		end
	end

	describe "agregar" do

		it "si se agrega correctamente un usuario" do

			expect(@controlador.agregar"monolo", 1634).to be(true)
		end

		it "si se agrega un usuario con numeros en el nombre y letras en la password" do
			expect(@controlador.agregar(1234, "monolo")).to be(true)
		end

	end	
end