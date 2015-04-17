require 'highline/import'
require_relative 'Clases/controlador.rb'
require_relative 'vista.rb'


  controlador = Controlador.new
  vista = Vista.new(controlador)