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
