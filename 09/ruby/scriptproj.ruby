Script started on Tue 19 Apr 2016 08:25:43 PM EDT
elc3@goldberg:~/Documents/214/code/09/ruby$ cat List.rb
# List.rb implements a linked list structure in Ruby.
#
# Begun by: Dr. Adams, for CS 214 at Calvin College.
# Completed by: Ethan Clark Project9
# Date: April 19, 2016
#######################################################

require 'test/unit/assertions'
include Test::Unit::Assertions

class List

   #########################################################
   ## initialize() creates an instance of our List Class  ##
   ## Receive: NONE                                       ##
   ## Output: first and last set to nil, length set to 0  ##
   #########################################################
   def initialize
	@first = nil
	@last = nil
	@length = 0
   end

   # Accessor for the List length attribute
   attr_reader :length

   # Am I empty?
   # Return: length == 0
   def empty?
      @length == 0
   end
  
   # append a value to me
   # Receive: value, the item to be appended
   # Postcondition: my last item is value and
   #                 my length is one more than it was
   def append(value)
      newNode = Node.new(value, nil)

      if empty?
         @first = newNode
      else
         @last.next = newNode      
      end

      @last = newNode
      @length += 1
      self
   end

   ################################################################
   ## print outputs the items in the list to the user            ##
   ## Receive: NONE                                              ##
   ## PRE: List has already been defined                         ##
   ## Output: each element in the List printed to the user       ##
   ################################################################
   def print
	temp = @first
	while !(temp.nil?)
		printf " #{temp.value}"
		temp = temp.next
	end
   end

   ################################################################
   ## max determines the maximum value in the List               ##
   ## Receive: NONE                                              ##
   ## PRE: List has already been defined                         ##
   ## Return: maxValue, the maximum value in the List            ##
   ################################################################
   def max
	temp = @first
	maxValue = nil
	if !temp.nil? then
		maxValue = temp.value
		temp = temp.next
	end
	while !temp.nil?
		if temp.value > maxValue then
			maxValue = temp.value
		end
		temp = temp.next
	end
	return maxValue
   end

   ######################################################################
   ## search(element) determines if element is in the List             ##
   ## Receive: element, an Integer                                     ##
   ## PRE: List has already been defined                               ##
   ## Return: Integer index of position of element, -1 if not in List  ##
   ######################################################################
   def search (element)
	temp=@first
	index = 0
	while !temp.nil?
		if temp.value == element then
			return index
		else
			index = index + 1
			temp = temp.next
		end
	end
	return -1
   end

   # Define the Node Class within the List Class with its data and methods
   class Node

	# Initialize the Node item with item and link
	def initialize(item, link)
		@value = item
		@next = link
	end

	# Define the accessor methods for the Node Class
	attr_reader :value
	attr_accessor :next

   end

end

elc3@goldberg:~/Documents/214/code/09/ruby$ cat max.rb
# max.rb tests a Ruby linked list.
#
# Begun by: Dr. Adams for CS 214 at Calvin College.
# Completed by: Ethan Clark Project9
# Date: April 19, 2016

require './List'

# Create four new lists with our List Class
list1 = List.new
list2 = List.new
list3 = List.new
list4 = List.new

# Append all the necessary items to each List
list1.append(99).append(88).append(77).append(66).append(55)
list2.append(55).append(66).append(77).append(88).append(99)
list3.append(55).append(77).append(99).append(88).append(66)
list4.append(44).append(55).append(66).append(77).append(88)

# Print out each list, find the maximum, and search for 99 in each list
list1.print 
puts
puts "Maximum of list1: #{list1.max}"
puts "List1 contains 99 in position: #{list1.search(99)}"
puts

list2.print 
puts
puts "Maximum of list2: #{list2.max}"
puts "List2 contains 99 in position: #{list2.search(99)}"
puts

list3.print 
puts
puts "Maximum of list3: #{list3.max}"
puts "List3 contains 99 in position: #{list3.search(99)}"
puts

list4.print
puts
puts "Maximum of list4: #{list4.max}"
puts "List4 contains 99 in position: #{list4.search(99)}"
puts


elc3@goldberg:~/Documents/214/code/09/ruby$ ruby max.rb
 99 88 77 66 55
Maximum of list1: 99
List1 contains 99 in position: 0

 55 66 77 88 99
Maximum of list2: 99
List2 contains 99 in position: 4

 55 77 99 88 66
Maximum of list3: 99
List3 contains 99 in position: 2

 44 55 66 77 88
Maximum of list4: 88
List4 contains 99 in position: -1

elc3@goldberg:~/Documents/214/code/09/ruby$ exit

Script done on Tue 19 Apr 2016 08:25:57 PM EDT
