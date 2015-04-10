require 'highline/import'

	salir = false;
		while !salir do
  			choose do |menu|
    		
    		menu.prompt = "Que desea hacer?"

    		menu.choice(:Salir) {
      			salir = true
      			say("\t Sale de la aplicación \n")
    		}

    		menu.choice(:Estado) do
	    		say("\t Tu estado es ... \n")
    		end
    	end
  	end
  	

