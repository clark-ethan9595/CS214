# Goose.rb | Defines the Goose class which inherits attributes and methods
#   from the Bird superclass.
#
# Begun by: Dr. Nelesen, for CS 214 at Calvin College.
# Completed by: Ethan Clark Lab10
# Date: April 22, 2016
####################################################

require './Bird.rb'

class Goose < Bird

	######################################################
	# call returns the sound that a Goose type makes     #
	# Recieve: NONE                                      #
	# Return: Honk!, a String                            #
	######################################################
	def call
		"Honk!"
	end

end
