# Duck.rb | Defines the Duck class which inherits attributes and methods
#   from the FlyingBird superclass.
#
# Begun by: Dr. Nelesen, for CS 214 at Calvin College.
# Completed by: Ethan Clark Project10
# Date: April 26, 2016
####################################################

require './FlyingBird.rb'

class Duck < FlyingBird

	######################################################
	# call returns the sound that a Duck type makes      #
	# Recieve: NONE                                      #
	# Return: Quack!, a String                           #
	######################################################
	def call
		"Quack!"
	end

end
