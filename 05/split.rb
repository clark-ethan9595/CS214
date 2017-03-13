# split.rb splits a string into two substrings.
#
# Input: A string and an integer string position to split the string by.
# Precondition: The position integer is within the range of the string size.
# Output: The substrings aString(0, position - 1) and
#   aString(pos, length() - 1).
#
# Begun by: Prof. Adams, for CS 214 at Calvin College.
# Completed by: Ethan Clark for CS 214 Lab5
# Date: March 2,2016
#################################################################


# split() splits a string into its two substrings.
# Receive: aString, the string to be split,       
#        pos, the split position.                  
# PRE: 0 <= pos < the length of aString.
# Return: the substring of aString before pos, and  
#         the substring of aString from pos onwards.
######################################################

def split (aString, position)

	# store the two substrings into the array new_array using string [] methods
	new_array = [aString[0, position], aString[position..aString.length]]
end

if __FILE__ == $0

	# prompt the user for a string
	print "To split a string, enter the string: "; 
  	the_string = gets

	# prompt the user for the split position for the substrings
  	print "Enter the split position: "; 
  	position = gets.to_i

	# call the split() method to get the substrings
  	split_string = split(the_string, position)

	# use the returned array to output the two substrings
  	puts "The first part is: " << split_string[0]
 	puts "and the second part is: " << split_string[1]
end
