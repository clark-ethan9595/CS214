# WalkingBird.rb | Defines the WalkingBird class which inherits attributes and methods
#   from the Bird superclass.
#
# Created by: Ethan Clark Project10
# Date: April 26, 2016
####################################################

require './Bird.rb'

class WalkingBird < Bird

	###########################################################
	# movement returns the move that a WalkingBird type does  #
	# Recieve: NONE                                           #
	# Return: walked, a String                                #
	###########################################################
	def movement
		"walked"
	end

end
