-- rectangle_area.adb compues the area of a rectangle
--
-- Input: The length and the width of a rectangle
-- Precondition: The length and width are positive
-- Output: The area of the rectangle
--
-- Created by: Ethan Clark, CS 214, Calvin College
-- Date: February 4, 2016
----------------------------------------------------

with Ada.Text_IO, Ada.Float_Text_IO;
use Ada.Text_IO, Ada.Float_Text_IO;

procedure rectangle_area is
	
	length, width, area : float;

	-- function rectangleArea computes a rectangle's area, given its length and width
   	-- Parameter: l and w, both floats
   	-- Precondition: l and w are both positive
   	-- Return: the area of the rectangle with length l and width w
   	----------------------------------------------------------------------------------
	function rectangleArea(l: in float; w: in float) return float is
	begin
		return l * w;
	end rectangleArea;

begin
	-- Prompt the user for the length of the rectangle
	Put_Line("To compute the area of a rectangle, first enter the length: ");
	-- Read in what the user typed	
	Get(length);

	-- Prompt the user for the width of the rectangle
	Put_Line("Now, enter the width: ");						
	-- Read in what the user typed	
	Get(width);
	
	-- Call rectangleArea to compute the area
	area := rectangleArea(length, width);
	
	-- Output to the user what the area of the rectangle is
	Put("The area is ");
	Put(area);
	New_Line;

end rectangle_area;
