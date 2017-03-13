# quadroots.rb computes the roots of a quadratic equation
#
# Input: three floats that correspond to the quadratic equation of
#	ax^2 + bx + c 
# Precondition: The preconditions are checked in the function quadraticRoots
# Output: the two roots of the equation if there are any
#	otherwise it prints out an error message for the user
#
# Created by: Ethan Clark for CS 214 Project5
# Date: March 9, 2016
#################################################################

def quadraticRoots(a, b, c)

	#if a does not equal 0...
	if (a != 0)
		
		#compute the discriminant to be used multiple times later
		arg = (b ** 2.0) - 4.0 * a * c

		#if the discriminant is greater than or equal to 0...
		if (arg >= 0)
			rootlist = [true] 
			rootlist.push((-b - Math.sqrt(arg)) / (2.0 * a))
			rootlist.push((-b + Math.sqrt(arg)) / (2.0 * a))

		#else if the discriminant is less than 0...
		else
			print "\n Error in quadraticRoots(): b^2 - 4ac is negative!\n"
			rootlist = [false]
	
		end

	#else if a equals 0...
	else
		print "\n Error in quadraticRoots(): a is zero!\n"
		rootlist = [false]

	end

end

#if this program is being run as the main file
if __FILE__ == $0

	#prompt the user to enter three floats for the quadratic equation
	print "\n To compute the roots of a quadratic equation...";
	print "\n 	enter three numbers in the form ax^2 + bx + c.";

	#receive the float value for a
	print "\n Enter the number for a: ";
	a_value = gets.to_f

	#receive the float value for b
	print "\n Enter the number for b: ";
	b_value = gets.to_f

	#receive the float value for c
	print "\n Enter the number for c: ";
	c_value = gets.to_f

	#call quadraticRoots that stores the roots into an array
	root_array = quadraticRoots(a_value, b_value, c_value)

	#if the first element in the array is true
	if root_array[0] == true

		#get the two roots from the array
		root1 = root_array[1]
		root2 = root_array[2]

		#show the user what the two roots are
		puts "\nThe roots of the quadratic equation are... "
		puts root1.to_s << " and " << root2.to_s << "."

	end

end
	
