Script started on Fri 22 Apr 2016 09:16:27 AM EDT
elc3@boole:~/Documents/214/code/10/ruby$ cat Bird.rb
# Bird.rb | Defines a Bird superclass to be extended by specific bird
#   sub-classes.
#
# Begun by: Dr. Nelesen, for CS 214 at Calvin College.
# Completed by: Ethan Clark Lab10
# Date: April 22, 2016
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

	######################################################
	# className returns the name of the Class, Bird      #
	# Recieve: NONE                                      #
	# Return: Bird                                       #
	######################################################
	def className
		self.class.to_s
	end

	##################################################################
	# print returns name, class Name, and the sound a Bird makes     #
	# Recieve: NONE                                                  #
	# Return: a String with name, class Name, and the sound          #
	##################################################################
	def print
		puts name + " " + className + " says " + call
	end
end
elc3@boole:~/Documents/214/code/10/ruby$ cat Owl.rb
# Owl.rb | Defines the Owl class which inherits attributes and methods
#   from the Bird superclass.
#
# Begun by: Dr. Nelesen, for CS 214 at Calvin College.
# Completed by: Ethan Clark Lab10
# Date: April 22, 2016
####################################################

require './Bird.rb'

class Owl < Bird

	######################################################
	# call returns the sound that a Owl type makes       #
	# Recieve: NONE                                      #
	# Return: Whoot!, a String                           #
	######################################################
	def call
		"Whoot!"
	end

end
elc3@boole:~/Documents/214/code/10/ruby$ cat Duck.rb
# Duck.rb | Defines the Duck class which inherits attributes and methods
#   from the Bird superclass.
#
# Begun by: Dr. Nelesen, for CS 214 at Calvin College.
# Completed by: Ethan Clark Lab10
# Date: April 22, 2016
####################################################

require './Bird.rb'

class Duck < Bird

	######################################################
	# call returns the sound that a Duck type makes      #
	# Recieve: NONE                                      #
	# Return: Quack!, a String                           #
	######################################################
	def call
		"Quack!"
	end

end
elc3@boole:~/Documents/214/code/10/ruby$ cat Goose.rb
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
elc3@boole:~/Documents/214/code/10/ruby$ cat birds.rb
# birds.rb | Tests out the menagerie of bird classes.
#
# Begun by: Dr. Nelesen, for CS 214 at Calvin College.
# Completed by: Ethan Clark Lab10
# Date: April 22, 2016
######################################################

require './Duck.rb'
require './Goose.rb'
require './Owl.rb'

bird0 = Bird.new "Hawkeye"
bird0.print

bird1 = Duck.new "Donald"
bird1.print

bird2 = Goose.new "Mother"
bird2.print

bird3 = Owl.new "Woodsey"
bird3.print
elc3@boole:~/Documents/214/code/10/ruby$ ruby birds.rb
Hawkeye Bird says Squaaaaaaawk!
Donald Duck says Quack!
Mother Goose says Honk!
Woodsey Owl says Whoot!
elc3@boole:~/Documents/214/code/10/ruby$ exit

Script done on Fri 22 Apr 2016 09:16:44 AM EDT
