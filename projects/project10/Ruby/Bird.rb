# Bird.rb | Defines a Bird superclass to be extended by specific bird
#   sub-classes.
#
# Begun by: Dr. Nelesen, for CS 214 at Calvin College.
# Completed by: Ethan Clark Project10
# Date: April 26, 2016
####################################################

class Bird

	# Define the getter for the name data for the Bird class
  	attr_reader :name

	######################################################
	# initialize(name) creates an instance of class Bird #
	# Recieve: name, a String                            #
	# Output: a Bird type has been initialized with name #
	######################################################
  	def initialize(name)
    		@name = name
  	end

	######################################################
	# call returns the sound that a Bird type makes      #
	# Recieve: NONE                                      #
	# Return: Squaaaaaaaaaaawk!, a String                #
	######################################################
	def call
		"Squaaaaaaawk!"
	end

	#########################################################
	# movement returns the movement that a Bird type does   #
	# Recieve: NONE                                         #
	# Return: moved, a String                               #
	#########################################################
	def movement
		"moved"
	end

	######################################################
	# className returns the name of the Class, Bird      #
	# Recieve: NONE                                      #
	# Return: Bird                                       #
	######################################################
	def className
		self.class.to_s
	end

	####################################################################
	# print returns name, class Name, and the sound a Bird makes       #
	# Recieve: NONE                                                    #
	# Output: a String with name, class Name, movement, and the sound  #
	####################################################################
	def print
		puts name + " " + className + " just " + movement + " and said " + call
	end
end
