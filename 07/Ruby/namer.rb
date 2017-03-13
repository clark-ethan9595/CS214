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

   # shortcut to define all the "setters for the Name class
   attr_writer :first, :middle, :last

   # Define the function fullName() to return the full name of a type Name
   def fullName()
	return first + " " + middle + " " + last
   end

   # Define print() to print the full name to the screen
   def print()
	puts ( fullName() )
	return fullName()
   end

   # Define lfmi() to return the names in the format LastFirstMiddleInitial.
   def lfmi()
	return last + " " + first + " " + middle[0] + "."
   end

   # Define readName() to read in each of the names for the Name class
   def readName()
	# Prompt for and receive the new first name
	puts "\nPlease enter the new first name: "
	@first = gets.chomp

	# Prompt for and receive the new middle name
	puts "\nPlease enter the new middle name: "
	@middle = gets.chomp

	# Prompt for and receive the new last name
	puts "\nPlease enter the new last name: "
	@last = gets.chomp
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

   # test the lfmi() function on the name John Paul Jones
   assert name.lfmi == "Jones John P.", "lfmi failed"

   # test the mutator functions to change each name
   name.first = "Ethan"
   name.middle = "Levi"
   name.last = "Clark"

   assert name.first == "Ethan", "first mutator failed"
   assert name.middle == "Levi", "middle mutator failed"
   assert name.last == "Clark", "last mutator failed"

   assert name.print == "Ethan Levi Clark", "updated print failed"

   # test the lfmi() function on the name Ethan Levi Clark
   assert name.lfmi == "Clark Ethan L.", "lfmi failed for updated name"

   # test the readName function for the Name class
   name.readName
   assert name.print != "Ethan Levi Clark", "readName did not change the names"
   
   print "All tests passed!\n"

end

testName

