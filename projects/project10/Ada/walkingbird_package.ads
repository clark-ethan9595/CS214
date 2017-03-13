-- walkingbird_package.ads gives WalkingBird-related declarations
--
-- Created by: Ethan Clark Project10
-- Date: April 26, 2016
--------------------------------------------------------------------

-- Import and use Bird_Package for inheritance purposes
with Bird_Package; use Bird_Package;

package WalkingBird_Package is

	type WalkingBird_Type is new Bird_Type with private;

	-----------------------------------------------------------
	-- A WalkingBird's movement ( Over-rides Bird.movement() )-
	-- Receive: A_WalkingBird , a WalkingBird_Type            -
	-- Return: "flew"                                         -
	-----------------------------------------------------------
	function movement(A_WalkingBird : in WalkingBird_Type) return String;

private

	-- Declare WalkingBird_Type record in the private section
	-- and to inherit Bird_Type details as well
	type WalkingBird_Type is new Bird_Type with
	record
		null;
	end record;

end WalkingBird_Package;
