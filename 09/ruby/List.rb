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

