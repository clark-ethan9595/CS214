Script started on Tue 26 Apr 2016 08:06:56 PM EDT
elc3@boole:~/Documents/214/code/projects/project10/Ruby$ cat Bird.rb
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
elc3@boole:~/Documents/214/code/projects/project10/Ruby$ cat FlyingBird.rb
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
elc3@boole:~/Documents/214/code/projects/project10/Ruby$ cat WalkingBird.rb
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
elc3@boole:~/Documents/214/code/projects/project10/Ruby$ cat Duck.rb
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
elc3@boole:~/Documents/214/code/projects/project10/Ruby$ cat Goose.rb
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
elc3@boole:~/Documents/214/code/projects/project10/Ruby$ cat Owl.rb
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
elc3@boole:~/Documents/214/code/projects/project10/Ruby$ cat Penguin.rb
# Penguin.rb | Defines the Penguin class which inherits attributes and methods
#   from the WalkingBird superclass.
#
# Created by: Ethan Clark Project10
# Date: April 26, 2016
####################################################

require './WalkingBird.rb'

class Penguin < WalkingBird

	######################################################
	# call returns the sound that a Penguin type makes   #
	# Recieve: NONE                                      #
	# Return: Huh-huh-huh-huuuuuuh!, a String            #
	######################################################
	def call
		"Huh-huh-huh-huuuuuuuuh!"
	end

end
elc3@boole:~/Documents/214/code/projects/project10/Ruby$ cat Ostrich.rb
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
elc3@boole:~/Documents/214/code/projects/project10/Ruby$ cat Kiwi.rb
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
elc3@boole:~/Documents/214/code/projects/project10/Ruby$ cat birds.rb
# birds.rb | Tests out the menagerie of bird classes.
#
# Begun by: Dr. Nelesen, for CS 214 at Calvin College.
# Completed by: Ethan Clark Project10
# Date: April 26, 2016
####################################################

require './Duck.rb'
require './Goose.rb'
require './Owl.rb'
require './Penguin.rb'
require './Ostrich.rb'
require './Kiwi.rb'

bird0 = Bird.new "Hawkeye"
bird0.print

bird1 = Duck.new "Donald"
bird1.print

bird2 = Goose.new "Mother"
bird2.print

bird3 = Owl.new "Woodsey"
bird3.print

bird4 = Penguin.new "HappyFeet"
bird4.print

bird5 = Ostrich.new "Speedy Gonzales"
bird5.print

bird6 = Kiwi.new "Janell"
bird6.print
elc3@boole:~/Documents/214/code/projects/project10/Ruby$ ruby birds.rb
Hawkeye Bird just moved and said Squaaaaaaawk!
Donald Duck just flew and said Quack!
Mother Goose just flew and said Honk!
Woodsey Owl just flew and said Whoot!
HappyFeet Penguin just walked and said Huh-huh-huh-huuuuuuuuh!
Speedy Gonzales Ostrich just walked and said Snork!
Janell Kiwi just walked and said Victory!
elc3@boole:~/Documents/214/code/projects/project10/Ruby$ exit

Script done on Tue 26 Apr 2016 08:07:26 PM EDT
