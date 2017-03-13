-- circle_area.adb computes the area of a circle.
--
-- Input: The radius of the circle.
-- Precondition: The radius is a positive number.
-- Output: The area of the circle.
--
-- Begun by: Dr. Nelesen, CS 214 at Calvin College.
-- Completed by: Ethan Clark
-- Date: February 04, 2016
----------------------------------------------------

with Ada.Text_IO, Ada.Float_Text_IO;
use  Ada.Text_IO, Ada.Float_Text_IO;

procedure circle_area is	-- How to begin an ADA program with the name circle_area

   radius, area : float; 	-- Two float variables to keep track of the circle's radius and area

   -- function circleArea computes a circle's area, given its radius
   -- Parameter: r, a float
   -- Precondition: r >= 0.0
   -- Return: the area of the circle whose radius is r
   ----------------------------------------------------
   function circleArea(r: in float) return float is 	-- Function named circleArea with parameter r, returns a float value
      PI : constant := 3.1415927;			-- We need a constant to use for the PI value because there is no PI value built in?
   begin						-- Begin the steps/actions of the function
      return PI * r ** 2;				-- Compute the area of the circle with the given radius
   end circleArea;					-- End the function

begin                           			-- Begin the procedure main part of the program
   Put_Line("To compute the area of a circle,");	-- Output a line to the terminal to prompt the user for a radius
   Put("enter its radius: ");
   Get(radius);						-- Read in the radius from the user

   area := circleArea(radius);				-- Compute the area by calling the circleArea function

   Put("The area is ");					-- Output a line and the area of the circle
   Put(area);
   New_Line;						-- Output a new line
end circle_area;					-- End the procedure main part of the program, circle_area
