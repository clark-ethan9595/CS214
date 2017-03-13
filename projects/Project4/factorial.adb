-- Factorial.adb computes the factorial of a given integer
--
-- Input: an integer
-- Precondition: the integer is positive
-- Output: the factorial of the given integer
--
-- Completed by: Ethan Clark for CS 214 Homework4 at Calvin College
-- Date: February 29, 2016
--------------------------------------------------------------

with Ada.Text_IO, Ada.Integer_Text_IO;
use  Ada.Text_IO, Ada.Integer_Text_IO;

procedure Factorial is

   number, answer : integer;

   function factorial(number: integer) return integer is

   begin
	-- initialize the answer variable to be 1
	answer := 1;
	
	-- counting loop to calculate the factorial of the user-input number
	for I in integer range 2 .. number loop
		
		answer := answer * I;

	end loop;

	return answer;

   end factorial;

begin
   -- Prompt and receive the user for the integer value
   Put_Line("Calculating factorial...");
   Put("Enter an integer: ");

   -- Receive the number from the user
   get(number);

   -- Output the factorial of the given input integer
   Put("The factorial of ");
   Put(number);
   Put(" is ");
   Put( factorial(number) );

end Factorial;
