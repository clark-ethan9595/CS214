#! /usr/bin/ruby
# circle_area.rb computes the area of a circle given its radius
# 
# Input: the radius of a circle
# Precondition: the radius is not negative
# Output: the area of the circle.
#
# Begun by: Dr. Nelesen, for CS 214 at Calvin College.
# Completed by: Ethan Clark
# Date: February 04, 2016
###############################################################

# function circleArea returns a circle's area, given its radius
# Parameters: r, a number
# Precondition: r > 0.
# Returns: the area of a circle whose radius is r.
PI = 3.1415927				# Define the PI variable to be set to the value of PI
def circleArea(r)			# Function called circleArea with parameter r
    PI * r ** 2 			# Compute the area of the circle with the given r radius
end					# End the circleArea function

if __FILE__ == $0			# Run this section of code IF this file is the main file being used...
   print "Enter the radius: "		# Output to the user for a radius
   radius = gets.chomp.to_f		# Input the radius from the user
   print "Area is: "			# Output "Area is:" and the area to the user
   puts circleArea(radius)
end					# End the main section of code
