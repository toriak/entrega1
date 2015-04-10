require 'highline/import'

	salir = false;
		while !salir do
  			choose do |menu|
    		
    		menu.prompt = "Que desea hacer?"

    		menu.choice(:Salir) {
      			salir = true
      			say("\t Sale de la aplicación \n")
    		}

    		menu.choice(:No) do
    			say("Ok, nos quedamos")
    	end
  	end
end

