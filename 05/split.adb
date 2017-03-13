-- split.adb splits an input string about a specified position.
--
-- Input: Astring, a string,
--        Pos, an integer.
-- Precondition: pos is in Astring'Range.
-- Output: The substrings Astring(Astring'First..Pos-1) and
--                        Astring(Pos..Astring'Last).
--
-- Begun by: Dr. Adams, for CS 214 at Calvin College.
-- Completed by: Ethan Clark for CS 214 Lab5
-- Date: March 4, 2016
--------------------------------------------------------------

with Ada.Text_IO, Ada.Integer_Text_IO, Ada.Strings.Fixed;
use  Ada.Text_IO, Ada.Integer_Text_IO, Ada.Strings.Fixed;

procedure split is

   	EMPTY_STRING : String := "                                        ";

   	Astring, Part1, Part2 : String  := EMPTY_STRING;
   	Pos, Chars_read       : Natural;

   ------------------------------------------------
   --  split() splits a string in two.           
   -- Receive: The_String, the string to be split,
   --          Position, the split index.        
   -- PRE: 0 < Position <= The_String.length(). 
   --     (Ada arrays are 1-relative by default)
   -- Passback: First_Part - the first substring,
   --           Last_Part - the second substring.
   ------------------------------------------------
   procedure split(The_String: in String; Position: in Natural) is
	begin
		-- Move the first substring into the Part1
		Move(The_String(The_String'First .. Position-1), Part1);

		-- Move the second substring into the Part2
		Move(The_String(Position .. The_String'Last), Part2);

	end;

begin   
	-- Prompt for the string
   	Put("To split a string, enter the string: ");
   	Get_Line(Astring, Chars_Read);

	-- Prompt for the split position
   	Put("Enter the split position: ");
   	Get(Pos);

	-- Call the split() function to split the string
   	split(Astring, Pos);

	-- Output the two substrings to the user
   	Put("The first part is ");
   	Put_Line(Part1);
   	Put(" and the second part is ");
   	Put_Line(Part2);

end split;

