require_relative '../Clases/lista_de_usuarios.rb'

describe ListaDeUsuario do
	
	describe "initialize" do

		it "crea correctamente una lista" do

			lista = ListaDeUsuario.new

			expect(lista.lista_de_usuarios).to eq([])
		end
	end
end