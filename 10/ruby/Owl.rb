# Owl.rb | Defines the Owl class which inherits attributes and methods
#   from the Bird superclass.
#
# Begun by: Dr. Nelesen, for CS 214 at Calvin College.
# Completed by: Ethan Clark Lab10
# Date: April 22, 2016
####################################################

require './Bird.rb'

class Owl < Bird

	######################################################
	# call returns the sound that a Owl type makes       #
	# Recieve: NONE                                      #
	# Return: Whoot!, a String                           #
	######################################################
	def call
		"Whoot!"
	end

end
