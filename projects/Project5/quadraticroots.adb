-- quadroots.adb computes the roots of a quadratic equation
--
-- Input: three floats corresponding to the quadratic equation of
---	ax^2 + bx + c
-- Precondition: preconditions are checked in the function quadRoots()
-- Output: the roots of the equation
--
-- Created by: Ethan Clark for CS 214 Project5
-- Date: March 9, 2016
--------------------------------------------------------------

with Ada.Text_IO, Ada.Float_Text_IO, Ada.Numerics.Elementary_Functions;
use Ada.Text_IO, Ada.Float_Text_IO, Ada.Numerics.Elementary_Functions;

procedure quadraticRoots is

	a_val, b_val, c_val, root1, root2, arg : Float;
	isRoot : Boolean;

	-----------------------------------------------------------
	--- quadRoots() computes the roots of a quadratic equation
	--- Receive: floats a, b, and c
	--- Precondition: a cannot be zero
	---		  and b^2 - 4ac cannot be negative
	--- Passback: root1 and root2, which are floats
	-----------------------------------------------------------
	procedure quadRoots(a: in Float; b: in Float; c: in Float) is
		begin
			--If a does not equal zero...
			if (a /= 0.0) then

				--compute discriminant which is used multiple times later
				arg := ((b ** 2) - 4.0 * a * c);
				
				--If the discriminant is greater than or equal to zero...
				if (arg >= 0.0) then
					root1 := (-b + Sqrt(arg)) / (2.0 * a);
					root2 := (-b - Sqrt(arg)) / (2.0 * a);
					isRoot := true;

				--else if the discriminant is less than zero...
				else
					Put("Error in quadRoots(): b^2 - 4ac is negative!");
					isRoot := false;

				end if;

			--else if a does equal zero...
			else
				Put("Error in quadRoots(): a is zero!");
				isRoot := false;

			end if;

		end;

begin
	--Prompt the user to enter three floats for the quad equation
	Put("To compute the roots of the quadratic equation...");
	New_Line;
	Put(" in the form of y = ax^2 + bx + c.");

	--Receive float a from the user
	New_Line;
	Put("Enter the number for a: ");
	Get(a_val);
	New_Line;

	--Receive float b from the user
	Put("Enter the number for b: ");
	Get(b_val);
	New_Line;

	--Receive float c from the user
	Put("Enter the number for c: ");
	Get(c_val);
	New_Line;

	--call quadRoots to compute the roots of the equation, if there are any
	quadRoots(a_val, b_val, c_val);

	--if there are roots to the equation, output them for the user
	if (isRoot = true) then
		New_Line;
		Put("The roots of the quadratic equation are ");
		Put(root1);
		Put(" and ");
		Put(root2);
	end if;

end quadraticRoots;
