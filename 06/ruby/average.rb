# average.rb averages the values of an array of doubles.
# Precondition: theArray is an array of numbers
# Output: the average of the values in theArray
#
# Begun by: Dr. Adams, for CS 214 at Calvin College.
# Completed by: Ethan Clark Lab6
# Date: 3/24/2016
########################################################

################################################
# sum() sums the values in an array            #
# Receive: anArray, an array of numbers        #
# Return: the sum of the values in anArray.    #
################################################
def sum (anArray)

	total = 0.0
	# use array each method to add up the numbers
	anArray.each {|x| total = x + total}

	return total
end

############################################################
# average() computes the average of the values in an array #
# Receive: anArray, an array of floats                     #
# Return: the sum divided by the number of values          #
############################################################
def average (anArray)

	#if the array is empty...
	if anArray.empty?
		return 0.0

	# otherwise, return the sum divided by the number of values
	else
		return sum(anArray) / anArray.size
	end
end

def main
	# declare the two arrays to be used as examples
	array0 = []
	array1 = [9.0, 8.0, 7.0, 6.0]

	# test the sum function
   	puts "sum array0 is: #{ sum(array0) }\n"
   	puts "sum array1 is: #{ sum(array1) }\n"

	# test the average function
   	puts "average array0 is: #{ average(array0) }\n"
   	puts "average array1 is: #{ average(array1) }\n"
end

main

