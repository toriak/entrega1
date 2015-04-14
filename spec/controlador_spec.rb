require_relative '../Clases/controlador.rb'
require_relative '../Clases/lista_de_usuarios.rb'

describe Controlador do

	before(:example) do

		@controlador = Controlador.new
	end

	describe "initialize" do
		it "" do
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

	end	
end