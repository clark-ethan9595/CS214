-- ostrich_package.adb gives ostrich-related definitions
--  by over-riding WalkingBird-related definitions.
--
-- Created by: Ethan Clark Project10
-- Date: April 26, 2016
---------------------------------------------------

with Ada.Text_IO;
use Ada.Text_IO;

package body Ostrich_Package is

 	----------------------------------------------------
 	-- An Ostrich's Call (Over-rides Bird.Call())      -
 	-- Receive: An_Ostrich, an Ostrich_Type.           -
 	-- Return: "Snork!"                                -
 	----------------------------------------------------
	function Call(An_Ostrich : in Ostrich_Type) return String is
	begin
		return "Snork!";
	end Call;

 	-----------------------------------------------------
 	-- Determine type of a Ostrich                      -
 	-- (Over-rides Bird.Type_Name())                    -
 	-- Receive: An_Ostrich, an Ostrich_Type.            -
 	-- Return: "Ostrich".                               -
 	-----------------------------------------------------
	function Type_Name(An_Ostrich : in Ostrich_Type) return String is
	begin
		return "Ostrich";
	end Type_Name;

end Ostrich_Package;
