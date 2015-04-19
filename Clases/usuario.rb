class Usuario

	attr_accessor :estado

	#el usuario puede posee como nombre letras o numeros a igual que con el password
	def initialize (nombre ,password)

		@nombre= nombre
		@password= password
    end

    def verificacion_password (unaPassword)

    	return @password == unaPassword

    end

    def verificacion_nombre (unNombre)

    	return @nombre == unNombre
    end

    def cambiar_cifrado(codificador_actual, nuevo_codificador)

        password_descifrado = codificador_actual.descifrar(@password)
        @password = nuevo_codificador.cifrar (password_descifrado)
    end
end