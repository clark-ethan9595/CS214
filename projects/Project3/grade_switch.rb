#! /usr/bin/ruby
# grade_switch.rb translates an integer score into a letter grade
# Created by: Ethan Clark for CS 214 at Calvin College
# Date: February 25, 2016
#################################################################

# Input: an integer average score
# Precondition: the score is a positive integer
# Output: the corresponding letter grade for the given score
def gradeSwitch score
	case (score / 10)
	when 10, 9			#If the score is between 90-100
		return "A"
	when 8				#If the score is between 80-89
		return "B"
	when 7				#If the score is between 70-79
		return "C"
	when 6				#If the score is between 60-69
		return "D"
	else				#Any other lower grade is an F
		return "F"
	end
end

if __FILE__ == $0

	#Ask the user if they want to enter their own score or run the tests
	print "\nWould you like to enter your own score or run the test?"
	print "\nEnter 1 for entering your own score and 2 for the tests: "

	choice = gets.chomp.to_i

	#If the user chooses to enter own score...
	if choice == 1
	
		print "Enter the score: "	#Prompt the user to enter the score
		score = gets.chomp.to_i		#Receive the input from the user
		print "Letter Grade is: "	#Output the corresponding letter grade
		puts gradeSwitch(score)

	#If the user chooses to run the tests...
	elsif choice == 2

		print "\nTesting the score of 100... "
		puts gradeSwitch(100)

		print "\nTesting the score of 95... "
		puts gradeSwitch(95)

		print "\nTesting the score of 89... "
		puts gradeSwitch(89)

		print "\nTesting the score of 80... "
		puts gradeSwitch(80)

		print "\nTesting the score of 77... "
		puts gradeSwitch(77)

		print "\nTesting the score of 66... "
		puts gradeSwitch(66)

		print "\nTesting the score of 55... "
		puts gradeSwitch(55)

	#Else anything the user enters is invalid
	else
		print "\nInvalid option!"

	end
end
