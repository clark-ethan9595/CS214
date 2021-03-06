-- penguin_package.ads gives Penguin-related declarations,
--  and derives Penguin from WalkingBird.
--
-- Created by: Ethan Clark Project10
-- Date: April 26, 2016
---------------------------------------------------

-- Import and use WalkingBird_Package for inheritance purposes
with WalkingBird_Package; use WalkingBird_Package;

package Penguin_Package is

	type Penguin_Type is new WalkingBird_Type with private;

 	----------------------------------------------------
 	-- A Penguin's Call (Over-rides Bird.Call())       -
 	-- Receive: A_Penguin, an Penguin_Type.            -
 	-- Return: "Huh-huh-huh-huuuuuuh!"                 -
 	----------------------------------------------------
	function Call(A_Penguin : in Penguin_Type) return String;

 	-----------------------------------------------------
 	-- Determine type of a Penguin                      -
 	-- (Over-rides Bird.Type_Name())                    -
 	-- Receive: A_Penguin, a Penguin_Type.              -
 	-- Return: "Penguin".                               -
 	-----------------------------------------------------
	function Type_Name(A_Penguin : in Penguin_Type) return String;

private

	-- Declare Penguin_Type record in the private section
	-- and to inherit WalkingBird_Type details as well
	type Penguin_Type is new WalkingBird_Type with
	record
		null;
	end record;


end Penguin_Package;
