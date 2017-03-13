-- Kiwi_package.adb gives Kiwi-related definitions
--  by over-riding WalkingBird-related definitions.
--
-- Created by: Ethan Clark Project10
-- Date: April 26, 2016
---------------------------------------------------

with Ada.Text_IO;
use Ada.Text_IO;

package body Kiwi_Package is

 	----------------------------------------------------
 	-- A Kiwi's Call (Over-rides Bird.Call())          -
 	-- Receive: A_Kiwi, a Kiwi_Type.                   -
 	-- Return: "Victory!"                              -
 	----------------------------------------------------
	function Call(A_Kiwi : in Kiwi_Type) return String is
	begin
		return "Victory!";
	end Call;

 	-----------------------------------------------------
 	-- Determine type of a Kiwi                         -
 	-- (Over-rides Bird.Type_Name())                    -
 	-- Receive: A_Kiwi, a Kiwi_Type.                    -
 	-- Return: "Kiwi".                                  -
 	-----------------------------------------------------
	function Type_Name(A_Kiwi : in Kiwi_Type) return String is
	begin
		return "Kiwi";
	end Type_Name;

end Kiwi_Package;
