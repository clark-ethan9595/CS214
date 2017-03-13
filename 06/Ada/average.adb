-- average.adb "test-drives" function Average.
-- Precondition: theArray is an array of numbers.
-- Output: the average of the numbers.
--
-- Begun by: Dr. Adams, CS 214 at Calvin College.
-- Completed by: Ethan Clark Lab6
-- Date: 3/24/2016
-----------------------------------------------

with Ada.Text_IO; use Ada.Text_IO;             -- Put(String)
with Ada.Float_Text_IO; use Ada.Float_Text_IO; -- Put(Float)

procedure average is

	-- declare the Vector array type
	type Vector is array (Positive range <>) of Float;

	-- declare our two example arrays
	array0 : Vector := (0.0, 0.0);
	array1 : Vector := (9.0, 8.0, 7.0, 6.0);

----------------------------------------------
-- sum() sums the values in an array         -
-- Receive: anArray, an array of numbers     -
-- Return: the sum of the values in anArray. -
----------------------------------------------
	function sum(A: Vector) return Float is
		Total : Float := 0.0;
		begin
			-- add up all the elements in the array
			--for I in A'Range loop
			for I in Integer range A'First .. A'Last loop
				Total := Total + A(I);
			end loop;
			return total;
		end sum;

--------------------------------------------------------------
-- average() computes the average of the values in an array --
-- Receive: anArray, an array of numbers                    --
-- Return: the average of those numbers                     --
--------------------------------------------------------------
	function average(anArray: Vector) return float is
		begin
			-- if there are no values in the array
			if anArray'length = 0 then
				return 0.0;
			-- otherwise call function sum and divide by the length of the array
			else
				return sum(anArray) / Float(anArray'length);
			end if;
		end average;

begin
   	Put(" average 0 is ");
   	Put( average(array0) );
   	New_line;
   	Put(" average 1 is ");
   	Put( average(array1) );
   	New_line;
end average;

