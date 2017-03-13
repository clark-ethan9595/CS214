# namer.rb tests class Name and its operations
#
# Begun by: Dr. Adams, for CS 214 at Calvin College.
# Completed by: Ethan Clark Lab8
# Date: April 12, 2016
####################################################

# imports the Name class and its methods
require "./Name"

require 'test/unit/assertions'
include Test::Unit::Assertions

# function that tests the Name class and its methods
def testName
   name = Names::Name.new("John", "Paul", "Jones")

   assert name.first == "John", 
           "first failed"
   assert name.middle == "Paul",
           "middle failed"
   assert name.last == "Jones",
           "last failed"
   assert name.fullName == "John Paul Jones",
           "fullName failed"
   assert name.print == "John Paul Jones",
           "print failed"
   
   print "All tests passed!\n"
end

testName

