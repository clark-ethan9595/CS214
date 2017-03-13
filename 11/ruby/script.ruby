Script started on Mon 02 May 2016 08:52:27 PM EDT
elc3@cray:~/Documents/214/code/11/ruby$ cat threaded_array_sum.rb
# threaded_array_sum.rb sums the values in an array with threading
#
# Begun by: Prof. Adams, for CS 214 at Calvin College.
# Completed by: Ethan Clark
# Date: May 2, 2016
#
# Usage: ruby thread_array_sum.rb <inFileName> <numThreads>
###############################################################

# make certain the input file was specified on the command-line
def checkCommandLine
  if ARGV.length != 2
     puts "\nUsage: sum <fileName> <numThreads>\n\n"
     exit(1)
  end
end

# return: an array containing the values from the file
#  whose name was specified on the command-line
def readFile
   strArray = IO.readlines( ARGV[0] )
   intArray = Array.new( Integer(strArray[0]) )
   for i in 2..strArray.size
      if  !strArray[i].nil?
         intArray[i-2] = Integer( strArray[i].chomp )
      end
   end
   intArray 
end

# Return: the sum of the values 
def sumSlice(values, id, sliceSize)
   start = id * sliceSize
   stop = start + sliceSize - 1
   myTotal = 0
   for i in start..stop
	myTotal += values[i]
   end
   myTotal
end

require 'thread'      # exclusive

   def sumInParallel(values, numThreads)
      sliceSize = values.size / numThreads
      threadArray = Array.new( numThreads )
      result = 0

      for i in 1..numThreads-1
         threadArray[i] = Thread.new { 
                             myTotal = sumSlice(values, 
                                                i,
                                                sliceSize) 
                             Thread.exclusive {
                                result += myTotal
                             }
                          }
      end

      myTotal  = sumSlice(values, 0, sliceSize)

      leftovers = values.size % numThreads
      if leftovers > 0
         for i in values.size-leftovers..values.size-1
            myTotal += values[i]
         end
      end

      Thread.exclusive {
         result += myTotal
      }

      for i in 1..numThreads-1
         threadArray[i].join
      end

      result
   end

def main
   checkCommandLine
   values = readFile
   startTime = Time.now
   total = sumInParallel(values, Integer( ARGV[1] ) )
   endTime = Time.now
   interval = (endTime - startTime).to_f
   puts "\nThe sum is #{total}\n"
   printf(" and computing it took %.9f seconds.\n\n", interval)
end

main

elc3@cray:~/Documents/214/code/11/ruby$ ruby threaded_array_sum.rb ../numbers/1000000numbers.txt 1

The sum is 500869305
 and computing it took 0.047713664 seconds.

elc3@cray:~/Documents/214/code/11/ruby$ ruby threaded_array_sum.rb ../numbers/1000000numbers.txt 1 4

The sum is 500892467
 and computing it took 0.069751058 seconds.

elc3@cray:~/Documents/214/code/11/ruby$ exit

Script done on Mon 02 May 2016 08:52:59 PM EDT
