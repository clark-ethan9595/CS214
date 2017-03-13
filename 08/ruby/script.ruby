Script started on Tue 12 Apr 2016 07:34:23 PM EDT
elc3@wirth:~/Documents/214/code/08/ruby$ cat namer.rb
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

elc3@wirth:~/Documents/214/code/08/ruby$ cat Name.rb
# Name.rb holds the infromation for the Class Name
#
# Completed by: Ethan Clark Lab8
# Date: April 12, 2016
####################################################

# wraps the Class Name into this module
module Names

# class Name to represent a Name
class Name

  def initialize(first, middle, last)
    @first, @middle, @last = first, middle, last
  end

  attr_reader :first, :middle, :last

  def fullName
    @first + " " + @middle + " " + @last
  end

  def print
    puts fullName
    fullName
  end

end

end
elc3@wirth:~/Documents/214/code/08/ruby$ ruby Name.rb
elc3@wirth:~/Documents/214/code/08/ruby$ ruby Namer     namer.rb
John Paul Jones
All tests passed!
elc3@wirth:~/Documents/214/code/08/ruby$ exit

Script done on Tue 12 Apr 2016 07:34:38 PM EDT
