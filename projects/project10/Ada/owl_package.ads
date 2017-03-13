-- owl_package.ads gives Owl-related declarations,
--  and derives Owl from Bird.
--
-- Begun by: Dr. Adams, CS 214 at Calvin College.
-- Completed by: Ethan Clark Project10
-- Date: April 26, 2016
---------------------------------------------------

-- Import and use FlyingBird_Package for inheritance purposes
with FlyingBird_Package; use FlyingBird_Package;

package Owl_Package is

	type Owl_Type is new FlyingBird_Type with private;

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
	-- and to inherit FlyingBird_Type details as well
	type Owl_Type is new FlyingBird_Type with
	record
		null;
	end record;


end Owl_Package;
