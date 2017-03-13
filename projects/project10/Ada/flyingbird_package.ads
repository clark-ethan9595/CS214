-- flyingbird_package.ads gives FlyingBird-related declarations
--
-- Created by: Ethan Clark Project10
-- Date: April 26, 2016
--------------------------------------------------------------------

-- Import and use Bird_Package for inheritance purposes
with Bird_Package; use Bird_Package;

package FlyingBird_Package is

	type FlyingBird_Type is new Bird_Type with private;

	-----------------------------------------------------------
	-- A FlyingBird's movement ( Over-rides Bird.movement() ) -
	-- Receive: A_FlyingBird , a FlyingBird_Type              -
	-- Return: "flew"                                         -
	-----------------------------------------------------------
	function movement(A_FlyingBird : in FlyingBird_Type) return String;

private

	-- Declare FlyingBird_Type record in the private section
	-- and to inherit Bird_Type details as well
	type FlyingBird_Type is new Bird_Type with
	record
		null;
	end record;

end FlyingBird_Package;
