Script started on Thu 31 Mar 2016 08:23:43 AM EDT
elc3@sutherland:~/Documents/214/code/projects/project6$ cat arrayprocessing.adb
-- arrayprocessing.adb "test-drives" functions printArray and readArray
-- Precondition: theArray is an array of doubles from the user
-- Output: each value in the array is printed to the user
--
-- Created by: Ethan Clark Project6
-- Date: 3/30/2016
-----------------------------------------------------------------------

with Ada.Text_IO; use Ada.Text_IO;                  -- Put(String)
with Ada.Float_Text_IO; use Ada.Float_Text_IO;      -- Put(Float)
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;  -- Put(Integer)

procedure arrayprocessing is

	-- declare the Vector array type
	type Vector is array (Positive range <>) of Float;
	
	-- declare the integer size to be prompted to the user
	size: Integer;

	---------------------------------------------------------------------
	-- printArray() prints out each element in the array to the user   --
	-- Receive: A, a Vector array type with Floats in it already       --
	-- Output: each element from A is printed for the user to see      --
	---------------------------------------------------------------------
	procedure printArray(A: Vector) is
	
		begin
			-- Let the user know they are about to see the elements
				-- from the array
			Put("Here are the elements in the array: ");
			New_Line;

			-- For loop to write out each element
			for i in Integer range A'First .. A'Last loop
				Put( A(i) );
				New_Line;
			end loop;

		end printArray;

	---------------------------------------------------------------------------
	-- readArray() fills in the array with floats from the user              --
	-- Receive: A, an empty Vector array type; size, Integer size of  array  --
	-- Output: A is filled with the values from the user                     --
	---------------------------------------------------------------------------
	procedure readArray(A: out Vector; size: Integer) is

		element: Float;

		begin
			-- Prompt the user to enter floats for the array
			Put("Please enter the array doubles: ");
			New_Line;

			-- For loop to get the element and put it in the array
			for i in A'Range loop
				Get(element);
				A(i) := element;
			end loop;

			New_Line;

		end readArray;

begin
	-- Prompt for and receive the size of the array from the user
	Put("Please give the size of the array: ");
	Get(size);
	New_Line;

	-- Declare our array of size from the user
	declare
		array1 : Vector(1 .. size);

	begin
		-- Call procedures readArray() and printArray()
		readArray(array1, size);
		printArray(array1);
	end;

end arrayprocessing;
elc3@sutherland:~/Documents/214/code/projects/project6$ gnatmake arrya  ayprocessing
gcc-4.6 -c arrayprocessing.adb
gnatbind -x arrayprocessing.ali
gnatlink arrayprocessing.ali
elc3@sutherland:~/Documents/214/code/projects/project6$ ./arry ayprocessing
Please give the size of the array: 5

Please enter the array doubles: 
1
2
3
4
5

Here are the elements in the array: 
 1.00000E+00
 2.00000E+00
 3.00000E+00
 4.00000E+00
 5.00000E+00
elc3@sutherland:~/Documents/214/code/projects/project6$ ./arrayprocessing
Please give the size of the array: 8

Please enter the array doubles: 
1
4
3
9
0
4
7
8

Here are the elements in the array: 
 1.00000E+00
 4.00000E+00
 3.00000E+00
 9.00000E+00
 0.00000E+00
 4.00000E+00
 7.00000E+00
 8.00000E+00
elc3@sutherland:~/Documents/214/code/projects/project6$ ./arrayprocessing
Please give the size of the array: 2

Please enter the array doubles: 
100
456

Here are the elements in the array: 
 1.00000E+02
 4.56000E+02
elc3@sutherland:~/Documents/214/code/projects/project6$ exit

Script done on Thu 31 Mar 2016 08:28:12 AM EDT
