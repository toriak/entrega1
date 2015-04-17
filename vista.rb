require 'highline/import'

class Vista

	def initialize(unControlador)
		@controlador = unControlador
		self.vista_de_usuario_deslogueado
	end
	
	def vista_de_usuario_deslogueado

		salir = false;
			while !salir do
				puts "Seleccione una accion:"
  				choose do |menu|

    			menu.choice(:Login){
   					say "Usted se ha logueado exitosamente!" 
   					salir = self.vista_de_usuario_logueado
    			}				

    			menu.choice(:Estado) do
	    			say("\n\t Tu estado es ... \n\n")
    			end

    			menu.choice(:Salir) {
      				salir = true
      				say("\t Adios, vuelva pronto \n")
    			}
    		end
  		end
	end

	def vista_de_usuario_logueado

		salir = false;
			while !salir do
				puts "Seleccione una accion:"
  				choose do |menu|

    			menu.choice(:Logout){
    				say("\n\t Deslogueando... \n\n")
    				return false
    			}				

    			menu.choice(:Estado) do
	    			say("\n\t Tu estado es logueado \n\n")
    			end

    			menu.choice(:Salir) {
      				say("\t Adios, vuelva pronto \n")
      				return true
    			}
    		end
  		end
	end
end