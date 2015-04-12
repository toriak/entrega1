require_relative '../Clases/lista_de_usuarios.rb'

describe ListaDeUsuario do
	
	describe "initialize" do

		it "crea correctamente una lista" do

			lista = ListaDeUsuario.new

			expect(lista.lista_de_usuarios).to eq([])
		end
	end

	describe "agregar_usuario" do

		lista = ListaDeUsuario.new

		it "agrega un Usuario nuevo" do

			lista.agregar_usuario (Usuario.new "raul", 22)

			expect(lista.buscar "raul",22).to be(true)
		end

		it "no agrega otro objeto a la lista" do

=begin	
			cuando se le envia el mensaje a la lista de agregar esta al terminar de ejecutarce devuelve
				-true si es que se a agregado correctamente
				-false si no se a agregado
=end 
			resultado = lista.agregar_usuario (ListaDeUsuario.new)
			expect(resultado).to be(false)
			
		end
	end


end