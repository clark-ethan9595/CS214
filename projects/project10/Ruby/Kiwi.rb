# Kiwi.rb | Defines the Kiwi class which inherits attributes and methods
#   from the WalkingBird superclass.
#
# Created by: Ethan Clark Project10
# Date: April 26, 2016
####################################################

require './WalkingBird.rb'

class Kiwi < WalkingBird

	######################################################
	# call returns the sound that a Kiwi type makes      #
	# Recieve: NONE                                      #
	# Return: Victory!, a String                         #
	######################################################
	def call
		"Victory!"
	end

end
