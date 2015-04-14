require_relative 'lista_de_usuarios.rb'

class TextoPlano

	def buscar(nombre_de_usuario, password, unaLista)

		return unaLista.buscar(nombre_de_usuario, password)
	end

	def agregar(nombre_usuario , password, unaLista)

		return unaLista.agregar_usuario(nombre_usuario, password)
	end

end