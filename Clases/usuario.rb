class Usuario
	
	attr_accessor :nombre
	attr_accessor :password
	attr_accessor :estado

	def initialize (nombre ,password)

		@nombre = nombre
		@password = password
    end

    def verificacion_password (unaPassword)

    	return @password == unaPassword
    	
    end

end