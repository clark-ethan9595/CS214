-- year_codes.adb converts academic year codes to corresponding years.
--
-- Begun by: Dr. Adams, for CS 214 at Calvin College.
--
-- Completed by: Ethan Clark for CS 214 at Calvin College.
-- Date: February 18, 2016
--
-- Input: year, a string
-- Precondition: year is one of "freshman", "sophomore", "junior", "senior"
-- Output: The year code (1, 2, 3 or 4) corresponding to year.
----------------------------------------------------

with Ada.Text_IO, Ada.Integer_Text_IO;
use  Ada.Text_IO, Ada.Integer_Text_IO;

procedure year_codes is

   	year : String(1..9) := "         ";
   	charsRead : Natural;

   -- function YearCode
   -- Receive: year, a string
   -- Precondition: year is one of (freshman, sophomore, junior, senior)
   -- Return: the integer code corresponding to year (1,2,3,4)
   function YearCode(year: String) return integer is

	begin
		if year = "freshman " then
			return 1;
		Elsif ( year = "sophomore" ) then
			return 2;
		Elsif ( year = "junior   " ) then
			return 3;
		Elsif ( year = "senior   " ) then
			return 4;
		Else
			return 0;
		end if;
	end YearCode;

begin                                          
   	Put("Enter your academic year: ");           -- Prompt for input
   	Get_Line(year, charsRead);                   -- Input
   	Put( YearCode(year) );                       -- Convert and output
   	New_Line;
end year_codes;

