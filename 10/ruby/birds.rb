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
