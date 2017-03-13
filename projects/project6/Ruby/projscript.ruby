Script started on Thu 31 Mar 2016 08:28:19 AM EDT
elc3@sutherland:~/Documents/214/code/projects/project6$ cat arrayprocessing.rb
# arrayprocessing.rb fills an array and prints out the values in it
# Precondition: theArray is an array of doubles
# Output: theArray filled with user input doubles
#
# Craeted by: Ethan Clark Project6
# Date: 3/30/2016
####################################################################

####################################################################
# function printArray() prints each value in the array             #
# Receive: anArray, array of doubles; size, int length of array    #
# Output: each double is printed to the user                       #
####################################################################
def printArray (anArray, size)

	# Let the user know each of the elements in the array
	print "\nThe elements in the array are: \n"

	# For loop that loops through each element in the array
	for i in 0..size
		print anArray[i]
		print "\n"
	end

end

########################################################################
# function readArray() reads input from the user and fills the array   #
# Receive: anArray, array of doubles; size, int length of array        #
# Output: anArray filled with doubles from the user                    #
########################################################################
def readArray (anArray, size)

	# Ask the user to start entering values for the array
	print "\nPlease enter #{size.to_i} values for the array: \n"

	#For loop to put the user input into the array
	for i in 0..size-1
		element = gets.chomp.to_f
		anArray[i] = element
	end
end

# function main() is the driver for the readArray and printArray functions
def main

	# Ask for and receive the size of the array
	print "\nEnter the size of the array: "
	size = gets.chomp.to_f

	# Create a new array with size from the user
	array = Array.new(size)

	# Call readArray() and then printArray()
	readArray(array, size)
	printArray(array, size)

end

main
elc3@sutherland:~/Documents/214/code/projects/project6$ ruby arrayprocessing.rb

Enter the size of the array: 5

Please enter 5 values for the array: 
1
2
3
4
5

The elements in the array are: 
1.0
2.0
3.0
4.0
5.0

elc3@sutherland:~/Documents/214/code/projects/project6$ ruby arrayprocessing.rb

Enter the size of the array: 8

Please enter 8 values for the array: 
1
1
5
6
99
0
34
5

The elements in the array are: 
1.0
1.0
5.0
6.0
99.0
0.0
34.0
5.0

elc3@sutherland:~/Documents/214/code/projects/project6$ ruby arrayprocessing.rb

Enter the size of the array: 2

Please enter 2 values for the array: 
10000
345

The elements in the array are: 
10000.0
345.0

elc3@sutherland:~/Documents/214/code/projects/project6$ exit

Script done on Thu 31 Mar 2016 08:28:57 AM EDT
