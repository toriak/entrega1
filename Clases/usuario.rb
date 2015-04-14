class Usuario
	
	attr_accessor :nombre
	attr_accessor :password
	attr_accessor :estado

	#el usuario puede posee como nombre letras o numeros a igual que con el password
	def initialize (nombre ,password)

		self.nombre= nombre
		self.password= password
    end

    def verificacion_password (unaPassword)

    	return self.password == unaPassword
    	
    end

    def verificacion_nombre (unNombre)

    	return self.nombre == unNombre
    end
end