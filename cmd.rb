require 'highline/import'

	choose do |menu|
  		menu.prompt = "Desea salir?"
  		menu.choice(:Si) {
    		say("Gracias por venir")
  		}
  		menu.choice(:No) {
    		say("Ok, nos quedamos")
  		}
	end
