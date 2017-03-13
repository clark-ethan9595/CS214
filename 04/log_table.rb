#! /usr/bin/ruby
# log_table.rb displays a table of logarithms
#
# Begun by: Dr. Nelesen, for CS 214 at Calvin College.
# Completed by: Ethan Clark
# Date: February 27, 2016
#
# Input:  The start, stop and increment values
# Precondition: The start value is less than the stop value, 
#     and the increment is greater than 0
# Output: A table of logarithms from start to stop, with increment
#     as the step value

# if this is the main file running
if __FILE__ == $0

   # receive the three necessary inputs from the user
   print "Enter the start value: "
   start = gets.chomp.to_f
   print "Enter the stop value: "
   stop = gets.chomp.to_f
   print "Enter the increment value: "
   increment = gets.chomp.to_f
   
  # while loop to print out the logarithm table
  while start <= stop do

	# first calculate the log
	calc_log = Math.log10(start)

	# print out the answer using Ruby string in-lining
	print "The logarithm of #{start} is #{calc_log}"
        puts("\n")

	#lastly, increment the start value
	start = start + increment

        end
end

