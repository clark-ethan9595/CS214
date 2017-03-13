# Goose.rb | Defines the Goose class which inherits attributes and methods
#   from the FlyingBird superclass.
#
# Begun by: Dr. Nelesen, for CS 214 at Calvin College.
# Completed by: Ethan Clark Project10
# Date: April 26, 2016
####################################################

require './FlyingBird.rb'

class Goose < FlyingBird

	######################################################
	# call returns the sound that a Goose type makes     #
	# Recieve: NONE                                      #
	# Return: Honk!, a String                            #
	######################################################
	def call
		"Honk!"
	end

end
