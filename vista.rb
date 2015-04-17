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

	def vista_de_usuario_logueado

			while !@salir do
				say "Seleccione una accion:"
  				choose do |menu|

    			menu.choice(:Logout){
    				say("\t Usted se ha deslogueado en forma exitosa\n")
    				return false
    			}

    			menu.choice(:Estado) do
	    			say("\t Tu estado es logueado\n")
    			end

    			menu.choice(:Salir) {
      				say("\t Adios, vuelva pronto\n")
      				return true
    			}
    		end
  		end
	end

  def accion_menu_login

    nombre_usuario = ask("nombre de usuario: ",String)

      password = ask("Password: ",String){
        |password| password.echo = "·"
      }

      if @controlador.existe_usuario?(nombre_usuario,password)

        say "\t Usted se ha logueado exitosamente!"
        @salir = self.vista_de_usuario_logueado
      else
        say "\tNombre de usuario o contraseña incorrecta \n"
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
end