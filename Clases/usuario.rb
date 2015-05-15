class Usuario

	attr_accessor :estado

	#el nombre y password del usuario puede estar conformado por letras, numeros o simbolos
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

  def cambiar_cifrado(codificador_actual, codificador_nuevo)
    @password = codificador_actual.cambiar_cifrado(@password, codificador_nuevo)
  end

  def guardar_cambios(nombre_usuario, password)
    @nombre = nombre_usuario
    @password = password
  end
end