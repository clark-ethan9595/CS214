-- owl_package.ads gives Owl-related declarations,
--  and derives Owl from Bird.
--
-- Begun by: Dr. Adams, CS 214 at Calvin College.
-- Completed by: Ethan Clark Lab10
-- Date: April 22, 2016
---------------------------------------------------

with Bird_Package; use Bird_Package;

package Owl_Package is

	type Owl_Type is new Bird_Type with private;

 	----------------------------------------------------
 	-- A Owl's Call (Over-rides Bird.Call())           -
 	-- Receive: An_Owl, an Owl_Type.                   -
 	-- Return: "Whoo!"                                 -
 	----------------------------------------------------
	function Call(A_Owl : in Owl_Type) return String;

 	-----------------------------------------------------
 	-- Determine type of a Owl                          -
 	-- (Over-rides Bird.Type_Name())                    -
 	-- Receive: An_Owl, an Owl_Type.                    -
 	-- Return: "Owl".                                   -
 	-----------------------------------------------------
	function Type_Name(A_Owl : in Owl_Type) return String;

private

	-- Declare Owl_Type record in the private section
	-- and to inherit Bird_Type details as well
	type Owl_Type is new Bird_Type with
	record
		null;
	end record;


end Owl_Package;
