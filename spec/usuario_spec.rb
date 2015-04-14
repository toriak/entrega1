require_relative '../Clases/usuario'

describe Usuario do


	describe "initialize" do

		it "crea correcta de un usuario" do 

			usuario = Usuario.new "raul", 22

			expect(usuario.nombre).to   eq("raul")
			expect(usuario.password).to   eq(22)

		end
	
		it "crea correcta de un usuario que en su nombre contenga una ñ " do 

			usuario = Usuario.new "ñoño", "lucas"

			expect(usuario.nombre).to   eq("ñoño")
			expect(usuario.password).to   eq("lucas")

		end
	end

	describe "verificacion_password" do

		usuario = Usuario.new "lucas" , 33
		it "retorna true cuando la password es la correcta" do
			expect(usuario.verificacion_password 33).to be(true)
		end

		it "retorna false cuando la password es incorrecta" do
			expect(usuario.verificacion_password 322).to be(false)
		end
	end

	describe "verificacion_nombre" do
		usuario = Usuario.new "jorje" , 42

		it "retorna true cuando el nombre es el correcto" do
			expect(usuario.verificacion_nombre "jorje").to be(true)
		end

		it "retorna false cuando el nombre es incorrecto" do
			expect(usuario.verificacion_nombre "manuela").to be(false)
		end

	end
end