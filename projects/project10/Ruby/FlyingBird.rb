# FlyingBird.rb | Defines the FlyingBird class which inherits attributes and methods
#   from the Bird superclass.
#
# Created by: Ethan Clark Project10
# Date: April 26, 2016
####################################################

require './Bird.rb'

class FlyingBird < Bird

	###########################################################
	# movement returns the move that a FlyingBird type does   #
	# Recieve: NONE                                           #
	# Return: flew, a String                                  #
	###########################################################
	def movement
		"flew"
	end

end
