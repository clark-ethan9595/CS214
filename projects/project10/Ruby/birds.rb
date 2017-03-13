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
