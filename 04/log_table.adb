-- log_table.adb computes a table of logarithms.
--
-- Input: start, stop, increment, three reals.
-- Precondition: increment is positive.
-- Output: A table of logarithms beginning with log(start),
--         ending with log(stop), with intervals of increment.
--
-- Begun by: Dr. Adams, for CS 214 at Calvin College.
-- Completed by: Ethan Clark
-- Date: February 27, 2016
--------------------------------------------------------------

with Ada.Text_IO, Ada.Float_Text_IO, Ada.Numerics.Elementary_Functions;
use  Ada.Text_IO, Ada.Float_Text_IO, Ada.Numerics.Elementary_Functions;

procedure log_table is

   Start, Stop, Increment : Float;

begin
   -- Prompt and receive the user for the start, stop, and increment values
   Put_Line("To print a table of logarithms,");
   Put(" enter the start, stop, and increment values: ");
   Get(Start); Get(Stop); Get(Increment);

   -- While loop to print the table of logarithms
   while Start <= Stop loop
	
	-- Output the logarithm of the Start value
	Put("The logarithm of ");
	Put(Start);
	Put(" is ");
	Put( log(Start, 10.0) );
	New_Line;

	-- Increment the start value before looping again
	Start := Start + Increment;

   end loop;

end log_table;

