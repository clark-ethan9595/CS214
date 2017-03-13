# Duck.rb | Defines the Duck class which inherits attributes and methods
#   from the Bird superclass.
#
# Begun by: Dr. Nelesen, for CS 214 at Calvin College.
# Completed by: Ethan Clark Lab10
# Date: April 22, 2016
####################################################

require './Bird.rb'

class Duck < Bird

	######################################################
	# call returns the sound that a Duck type makes      #
	# Recieve: NONE                                      #
	# Return: Quack!, a String                           #
	######################################################
	def call
		"Quack!"
	end

end
