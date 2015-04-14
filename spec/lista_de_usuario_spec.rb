require_relative '../Clases/lista_de_usuarios.rb'

describe ListaDeUsuario do
	
	before(:example) do
    	@lista = ListaDeUsuario.new
  	end

	describe "initialize" do

		it "crea correctamente una lista" do

			expect(@lista.lista_de_usuarios).to eq([])
		end
	end

	describe "agregar_usuario" do

		it "agrega un Usuario nuevo" do

			@lista.agregar_usuario("raul", 22)

			expect(@lista.buscar "raul",22).to be(true)
		end
	end

	describe "buscar" do

		it "encuentra a un usuario que esta en la lista" do
			@lista.agregar_usuario("Mauro" , 22)
			resultado = @lista.buscar"Mauro" ,22
			expect(resultado).to be(true)
		end

		it "encuentra a un usuario que no esta en la lista" do
			resultado = @lista.buscar"Jose" ,1234
			expect(resultado).to be(false)
		end
	end

end