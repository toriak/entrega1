class Usuario
	
	attr_accessor :nombre
	attr_accessor :contraseña
	attr_accessor :estado

	def initialize (unNombre, unaContraseña)

		@nombre = unNombre
		@contraseña = unaContraseña
	end

	def verificar_contraseña (pass)

		if @contraseña == pass
			return true
		else
			return false
		end

	end



end