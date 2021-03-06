require 'highline/import'

class Vista
	def initialize(unControlador)
		@controlador = unControlador
		self.vista_de_usuario_deslogueado
    @salir = false;
	end

	def vista_de_usuario_deslogueado
		while !@salir do
			say "Seleccione una accion:"
  		choose do |menu|
    		menu.choice(:Login){
    			@salir = self.accion_menu_login
   			}
        menu.choice(:registrar){
          self.accion_menu_registrar
        }
    		menu.choice(:Estado) do
	   			say("\t Tu estado es deslogueado\n")
    		end
      	menu.choice(:Salir) {
    			@salir = true
    			say("\t Adios, vuelva pronto \n")
    		}
    	end
  	end
	end

	def vista_de_usuario_logueado(nombre)

    nombre_usuario = nombre

		while !@salir do
			say "Seleccione una accion:"
  		choose do |menu|
   			menu.choice(:Logout){
   				say("\t Usted se ha deslogueado en forma exitosa\n")
   				return false
   			}
        menu.choice(:EliminarUsuario){
          say("\t Usted ha Eliminado su Cuenta de Usuario\n")
          self.eliminar_usuario(nombre)
          self.vista_de_usuario_deslogueado
        }
        menu.choice(:ModificarDatos){
          say("\t Datos Actuales\n")
          self.modificar_datos(nombre)
        }
   			menu.choice(:Estado) do
     			say("\t Tu estado es logueado como #{nombre_usuario}\n")
   			end
        menu.choice(:cifrado)do
          self.menu_cifrados
        end
   			menu.choice(:Salir) {
   				say("\t Adios, vuelva pronto\n")
   				@salir = true
   			}
   		end
 		end
	end

  def modificar_datos(nombre)
    say("\t nombre de usuario : #{nombre} \n")
    say("\t contraseña : ··········\n")
    say("\t Ingrese sus nuevos datos \n")
    nombre_usuario = ask("nombre de usuario: ",String)
    password = ask("Password: ",String){
      |password| password.echo = "·"
    }
    if (nombre_usuario.size > 0 and password.size >0)

      if @controlador.existe_nombre_usuario (nombre_usuario)
        say "\t El nombre de usuario actualmete esta ocupado!"
        self.modificar_datos(nombre)
      else
        @controlador.guardar_cambios(nombre,nombre_usuario, password)
        say "\t Se ah actualizado los datos de su cuenta  \n"
        self.vista_de_usuario_logueado(nombre_usuario)
      end
    else
      say "\t No ingreso correctamente el Nombre o la contraseña"
      self.modificar_datos(nombre)
    end
  end
  def eliminar_usuario(nombre)
    return @controlador.eliminar_usuario(nombre)
  end
  def accion_menu_login
    nombre_usuario = ask("nombre de usuario: ",String)
    password = ask("Password: ",String){
      |password| password.echo = "·"
    }
    if @controlador.existe_usuario?(nombre_usuario,password)
      say "\t Usted se ha logueado exitosamente!"
      @salir = self.vista_de_usuario_logueado(nombre_usuario)
    else
      say "\tNombre de usuario o contraseña incorrecta \n"
      @salir = false
    end
  end

  def accion_menu_registrar
    nombre_usuario = ask("nombre de usuario: ",String)
    password = ask("Password: ",String){
      |password| password.echo = "·"
    }
    if @controlador.agregar_usuario(nombre_usuario,password)
      say "\t Usted se ha registrado exitosamente!"
    else
      say "\tNombre de usuario ocupado \n"
    end
  end

  def menu_cifrados
    say "Seleccione una opcion de cifrado:"
    choose do |menu|
    menu.choice(:textoPlano){
      if @controlador.cifrado_texto_plano
        say("\t se a cambiado la encriptacion a Texto Plano correctamente\n")
      else
        say("\t se a cambiado la encriptacion a Texto Plano correctamente\n\t
          pero se a cambiado la password de todos los usuarios por 1234\n")
      end
      return false
    }
    menu.choice(:CaesarCipher) do
      if @controlador.cifrado_caesar_cipher
        say("\t se a cambiado la encriptacion a Caesar Cipher correctamente\n")
      else
        say("\t se a cambiado la encriptacion a Caesar Cipher correctamente\t
          pero se a cambiado la password de todos los usuarios por 1234\n")
      end
      return false
    end
    menu.choice(:BCrypt) {
      if @controlador.cifrado_bcrypt
        say("\t se a cambiado la encriptacion a BCrypt correctamente\n")
      else
        say("\t se a cambiado la encriptacion a BCrypt correctamente\t
          pero se a cambiado la password de todos los usuarios por 1234\n")
      end
      return false
      }
    end
  end
end