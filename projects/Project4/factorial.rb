#! /usr/bin/ruby
# factorial.rb calculates the factorial of an integer given from the user
# Created by: Ethan Clark for CS214 Project4 at Calvin College
# Date: March 2, 2016
#########################################################################

# Input: an integer value
# Precondition: the integer is positive
# Output: the corresponding factorial

def factorial value
	
	# Intialize the return value to be 1
	answer = 1

	#For loop to calculate the factorial of value
	for i in 2..value
		answer = answer * i
	end

	# Return the factorial to the main program
	return answer
end

# If this is the main file running
if __FILE__ == $0
	
	# Prompt the user to enter an integer
	print "Enter an integer: "
	value = gets.chomp.to_i

	# Calculate the factorial
	new_value = factorial(value)

	# Print out the factorial to the user
	print "\nThe factorial of #{value} is #{new_value}\n"

end
