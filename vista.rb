require 'highline/import'

class Vista

	def initialize(unControlador)
		@controlador = unControlador
	end
	
	def vista_de_inicio

		salir = false;
			while !salir do
  				choose do |menu|
    		
    			menu.prompt = "Que desea hacer?"

    			menu.choice(:Salir) {
      				salir = true
      				say("\n\t Sale de la aplicación \n\n")
    			}

    			menu.choice(:Logout){
    				say("\n\t Deslogueando... \n\n")
    			}

    			menu.choice(:Login){
    				say("\n\t Logueando... \n")
    			}	

    			menu.choice(:Estado) do
	    			say("\n\t Tu estado es ... \n\n")
    			end
    		end
  		end
	end
	

end