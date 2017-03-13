#! /usr/bin/ruby
# rectangle_area.rb computes the area of a rectangle given its length and width
# 
# Input: the length and width of a rectangle
# Precondition: the length and width are positive
# Output: the area of the rectangle
#
# Created by: Ethan Clark, CS 214, Calvin College
# Date: February 4, 2016
###############################################################

# function rectangleArea returns a rectangle's area, given its length and width
# Parameters: l and w, both numbers
# Precondition: l and w are both positive
# Returns: the area of a rectangle whose length is r and width is w

def rectangleArea(l, w)
	l * w
end

if __FILE__ == $0
	print "First enter the length: "	# Prompt the user for the length
	length = gets.chomp.to_f
	print "Now enter the width: "		# Prompt the user for the width
	width = gets.chomp.to_f
	print "Area of the rectangle is: "	# Return the area to the user
	puts rectangleArea(length, width)
end
