
def Usuario

	attr_accessor :@nombre
	attr_accessor :@contraseña
	attr_accessor :@estado

	def verificarContraseña (unaContraseña)

		return @contraseña = unaContraseña
	end

end