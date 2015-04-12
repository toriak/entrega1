require_relative '../Clases/usuario'

describe Usuario do


	describe "initialize" do

		it "crea correcta de un usuario" do 

			usuario = Usuario.new "raul", 22

			expect(usuario.nombre).to   eq("raul")
			expect(usuario.password).to   eq(22)

		end
	end

end