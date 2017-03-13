Script started on Tue 05 Apr 2016 07:09:36 PM EDT
elc3@atanasoff:~/Documents/214/code/07$ cat namer.rb
# namer.rb tests class Name and its operations
#
# Begun by: Dr. Adams, for CS 214 at Calvin College.
# Completed by: Serita Nelesen and Ethan Clark Lab7
# Date: March 31, 2016
####################################################

require 'test/unit/assertions'   # needed for assert
include Test::Unit::Assertions

class Name

   # Define the function initialize() to initialize the members of the Name class
   def initialize(first, middle, last)
	@first, @middle, @last = first, middle, last
   end

   # shortcut to define all the "getters" for the Name class
   attr_reader :first, :middle, :last

   # Define the function fullName() to return the full name of a type Name
   def fullName()
	return first + " " + middle + " " + last
   end

   # Define print() to print the full name to the screen
   def print()
	puts ( fullName() )
	return fullName()
   end

end

# testName tests all the operations in the class Name
def testName
   
   # Define name to be a new Name type
   name = Name.new("John", "Paul", "Jones")

   # test the accessors for the Name class
   assert name.first == "John", "first failed"
   assert name.middle == "Paul", "middle failed"
   assert name.last == "Jones", "last failed"

   # test the function fullName() in the Name class
   assert name.fullName == "John Paul Jones", "fullName failed"

   # test the print() function in the Name class
   assert name.print == "John Paul Jones", "print failed"
   
   print "All tests passed!\n"

end

testName

elc3@atanasoff:~/Documents/214/code/07$ ruby namer.rb
John Paul Jones
All tests passed!
elc3@atanasoff:~/Documents/214/code/07$ exit

Script done on Tue 05 Apr 2016 07:09:48 PM EDT
