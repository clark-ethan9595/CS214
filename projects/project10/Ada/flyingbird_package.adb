-- flyingbird_package.adb gives FlyingBird-related definitions
--  by over-riding Bird-related definitions.
--
-- Created by: Ethan Clark Project10
-- Date: April 26, 2016
--------------------------------------------------------------------

with Ada.Text_IO;
use Ada.Text_IO;

package body FlyingBird_Package is

	-----------------------------------------------------------
	-- A FlyingBird's movement ( Over-rides Bird.movement() ) -
	-- Receive: A_FlyingBird , a FlyingBird_Type              -
	-- Return: "flew"                                         -
	-----------------------------------------------------------
	function movement(A_FlyingBird : in FlyingBird_Type) return String is
	begin
		return "flew";
	end movement;

end FlyingBird_Package;
