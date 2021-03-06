-- kiwi_package.ads gives Kiwi-related declarations,
--  and derives Kiwi from WalkingBird.
--
-- Created by: Ethan Clark Project10
-- Date: April 26, 2016
---------------------------------------------------

-- Import and use WalkingBird_Package for inheritance purposes
with WalkingBird_Package; use WalkingBird_Package;

package Kiwi_Package is

	type Kiwi_Type is new WalkingBird_Type with private;

 	----------------------------------------------------
 	-- A Kiwi's Call (Over-rides Bird.Call())          -
 	-- Receive: A_Kiwi, a Kiwi_Type.                   -
 	-- Return: "Victory!"                              -
 	----------------------------------------------------
	function Call(A_Kiwi : in Kiwi_Type) return String;

 	-----------------------------------------------------
 	-- Determine type of a Kiwi                         -
 	-- (Over-rides Bird.Type_Name())                    -
 	-- Receive: A_Kiwi, a Kiwi_Type.                    -
 	-- Return: "Kiwi".                                  -
 	-----------------------------------------------------
	function Type_Name(A_Kiwi : in Kiwi_Type) return String;

private

	-- Declare Kiwi_Type record in the private section
	-- and to inherit WalkingBird_Type details as well
	type Kiwi_Type is new WalkingBird_Type with
	record
		null;
	end record;


end Kiwi_Package;
