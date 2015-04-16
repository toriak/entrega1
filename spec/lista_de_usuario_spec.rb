require_relative '../Clases/lista_de_usuarios.rb'

describe ListaDeUsuario do
	
	before(:example) do
    	@lista = ListaDeUsuario.new
  	end
  	
	describe "agregar_usuario" do

		it "agrega un Usuario nuevo" do

			@lista.agregar_usuario("raul", 22)

			expect(@lista.existe_usuario "raul",22).to be(true)
		end
	end

	describe "existe_usuario" do

		it "encuentra a un usuario que esta en la lista" do
			@lista.agregar_usuario("Mauro" , 22)
			resultado = @lista.existe_usuario"Mauro" ,22
			expect(resultado).to be(true)
		end

		it "encuentra a un usuario que no esta en la lista" do
			resultado = @lista.existe_usuario"Jose" ,1234
			expect(resultado).to be(false)
		end
	end

end