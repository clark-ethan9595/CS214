# Ostrich.rb | Defines the Ostrich class which inherits attributes and methods
#   from the WalkingBird superclass.
#
# Created by: Ethan Clark Project10
# Date: April 26, 2016
####################################################

require './WalkingBird.rb'

class Ostrich < WalkingBird

	######################################################
	# call returns the sound that a Ostrich type makes   #
	# Recieve: NONE                                      #
	# Return: Snork!, a String                           #
	######################################################
	def call
		"Snork!"
	end

end
