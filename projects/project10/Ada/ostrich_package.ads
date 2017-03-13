-- ostrich_package.ads gives Ostrich-related declarations,
--  and derives Ostrich from WalkingBird.
--
-- Created by: Ethan Clark Project10
-- Date: April 26, 2016
---------------------------------------------------

-- Import and use WalkingBird_Package for inheritance purposes
with WalkingBird_Package; use WalkingBird_Package;

package Ostrich_Package is

	type Ostrich_Type is new WalkingBird_Type with private;

 	----------------------------------------------------
 	-- A Ostrich's Call (Over-rides Bird.Call())       -
 	-- Receive: An_Ostrich, an Ostrich_Type.           -
 	-- Return: "Snork!"                                -
 	----------------------------------------------------
	function Call(An_Ostrich : in Ostrich_Type) return String;

 	-----------------------------------------------------
 	-- Determine type of a Ostrich                      -
 	-- (Over-rides Bird.Type_Name())                    -
 	-- Receive: An_Ostrich, an Ostrich_Type.            -
 	-- Return: "Ostrich".                               -
 	-----------------------------------------------------
	function Type_Name(An_Ostrich : in Ostrich_Type) return String;

private

	-- Declare Ostrich_Type record in the private section
	-- and to inherit WalkingBird_Type details as well
	type Ostrich_Type is new WalkingBird_Type with
	record
		null;
	end record;


end Ostrich_Package;
