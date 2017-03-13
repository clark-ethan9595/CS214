# Owl.rb | Defines the Owl class which inherits attributes and methods
#   from the FlyingBird superclass.
#
# Begun by: Dr. Nelesen, for CS 214 at Calvin College.
# Completed by: Ethan Clark Project10
# Date: April 26, 2016
####################################################

require './FlyingBird.rb'

class Owl < FlyingBird

	######################################################
	# call returns the sound that a Owl type makes       #
	# Recieve: NONE                                      #
	# Return: Whoot!, a String                           #
	######################################################
	def call
		"Whoot!"
	end

end
