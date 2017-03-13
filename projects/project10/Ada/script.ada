Script started on Tue 26 Apr 2016 07:50:01 PM EDT
elc3@boole:~/Documents/214/code/projects/project10/Ada$ cat bird_package.ads
-- bird_package.ads gives Bird-related declarations
--
-- Begun by: Dr. Adams, for CS 214 at Calvin College.
-- Completed by: Ethan Clark Project10
-- Date: April 26, 2016
---------------------------------------------------

package Bird_Package is

	type Bird_Type is tagged private;

 	----------------------------------------------------
 	-- initialization                                  -
 	-- Receive: A_Bird, a Bird_Type;                   -
 	--          Name, a String                         -
 	-- Return: a Bird_Type whose My_Name = Name.       -
 	----------------------------------------------------
	procedure Init(A_Bird : out Bird_Type; Name: in String);

 	----------------------------------------------------
 	-- Name accessor                                   -
 	-- Receive: A_Bird, a Bird_Type.                   -
 	-- Return: A_Bird.My_Name.                         -
 	----------------------------------------------------
	function Name(A_Bird : in Bird_Type) return String;

 	----------------------------------------------------
 	-- A Bird's Call                                   -
 	-- Receive: A_Bird, a Bird_Type.                   -
 	-- Return: a default bird-call ("Squawk!").        -
 	----------------------------------------------------
	function Call(A_Bird : in Bird_Type) return String;

 	----------------------------------------------------
 	-- Determine type of a Bird (for derived types)    -
 	-- Receive: A_Bird, a Bird_Type.                   -
 	-- Return: "Bird".                                 -
 	----------------------------------------------------
	function Type_Name(A_Bird: in Bird_Type) return String;

 	----------------------------------------------------
 	-- Output a Bird                                   -
 	-- Receive: A_Bird, a Bird or subclass of Bird.    -
 	-- Output: Everything known about A_Bird           -
 	----------------------------------------------------
	procedure Put(A_Bird : in Bird_Type'Class);

	----------------------------------------------------
 	-- A Bird's Movement                               -
 	-- Receive: A_Bird, a Bird_Type.                   -
 	-- Return: a default bird-movement ("moved!").     -
 	----------------------------------------------------
	function movement(A_Bird: in Bird_Type) return String;

private

	-- Declare the private Bird_Type record
	type Bird_Type is tagged record
		My_Name : String(1..6);
	end record;

end Bird_Package;
elc3@boole:~/Documents/214/code/projects/project10/Ada$ cat bird_package.adb
-- bird_package.adb gives Bird-related definitions
--
-- Begun by: Dr. Adams, CS 214 at Calvin College.
-- Completed by: Ethan Clark Project10
-- Date: April 26, 2016
---------------------------------------------------

with Ada.Text_IO;
use Ada.Text_IO;

package body Bird_Package is

 	----------------------------------------------------
 	-- initialization                                  -
 	-- Receive: A_Bird, a Bird_Type;                   -
 	--          Name, a String                         -
 	-- Return: a Bird_Type in which My_Name = Name.    -
 	----------------------------------------------------
	procedure Init(A_Bird : out Bird_Type; Name: in String) is
	begin
		A_Bird.My_Name := Name;
	end Init;

 	----------------------------------------------------
 	-- Name accessor                                   -
 	-- Receive: A_Bird, a Bird_Type.                   -
 	-- Return: A_Bird.My_Name.                         -
 	----------------------------------------------------
	function Name(A_Bird : in Bird_Type) return String is
	begin
		return A_Bird.My_Name;
	end Name;

	----------------------------------------------------
 	-- A Bird's Call                                   -
 	-- Receive: A_Bird, a Bird_Type.                   -
 	-- Return: a default bird-call ("Squawk!").        -
 	----------------------------------------------------
	function Call(A_Bird : in Bird_Type) return String is
	begin
		return "Squawwwwwwwwwk!";
	end Call;

 	----------------------------------------------------
 	-- Determine type of a Bird (for derived types)    -
 	-- Receive: A_Bird, a Bird_Type.                   -
 	-- Return: "Bird".                                 -
 	----------------------------------------------------
	function Type_Name(A_Bird: in Bird_Type) return String is
	begin
		return "Bird";
	end Type_Name;

	----------------------------------------------------
 	-- A Bird's Movement                               -
 	-- Receive: A_Bird, a Bird_Type.                   -
 	-- Return: a default bird-movement ("moved!").     -
 	----------------------------------------------------
	function movement(A_Bird: in Bird_Type) return String is
	begin
		return "moved";
	end movement;

 	----------------------------------------------------
 	-- Output a Bird                                   -
 	-- Receive: A_Bird, a Bird or subclass of Bird.    -
 	-- Output: Everything known about A_Bird           -
 	----------------------------------------------------
	procedure Put(A_Bird : in Bird_Type'Class) is
	begin
		Put( Name(A_Bird) );
		Put( ' ' );
		Put( Type_Name(A_Bird) );
		Put( " just " );
		Put( movement(A_Bird) );
		Put( " and said ");
		Put( Call(A_Bird) );
	end Put;

end Bird_Package;

elc3@boole:~/Documents/214/code/projects/project10/Ada$ cat flyingBir   bird_package.ads
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
elc3@boole:~/Documents/214/code/projects/project10/Ada$ cat flyingbird_package.adb
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
elc3@boole:~/Documents/214/code/projects/project10/Ada$ cat walkingbird_package.ads
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
elc3@boole:~/Documents/214/code/projects/project10/Ada$ cat walkingB bird_package.adb
-- walkingbird_package.adb gives WalkingBird-related definitions
--  by over-riding Bird-related definitions.
--
-- Created by: Ethan Clark Project10
-- Date: April 26, 2016
--------------------------------------------------------------------

with Ada.Text_IO;
use Ada.Text_IO;

package body WalkingBird_Package is

	-----------------------------------------------------------
	-- A WalkingBird's movement ( Over-rides Bird.movement() )-
	-- Receive: A_WalkingBird , a WalkingBird_Type            -
	-- Return: "walked"                                       -
	-----------------------------------------------------------
	function movement(A_WalkingBird : in WalkingBird_Type) return String is
	begin
		return "walked";
	end movement;

end WalkingBird_Package;
elc3@boole:~/Documents/214/code/projects/project10/Ada$ cat duck_package.ads
-- duck_package.ads gives Duck-related declarations,
--
--  and derives Duck from Bird.
-- Begun by: Dr. Adams, CS 214 at Calvin College.
-- Completed by: Ethan Clark Project10
-- Date: April 26, 2016
---------------------------------------------------

-- Import and use FlyingBird_Package for inheritance purposes
with FlyingBird_Package; use FlyingBird_Package;

package Duck_Package is

	type Duck_Type is new FlyingBird_Type with private;

 	----------------------------------------------------
 	-- A Duck's Call (Over-rides Bird.Call())          -
 	-- Receive: A_Duck, a Duck_Type.                   -
 	-- Return: "Quack!"                                -
 	----------------------------------------------------
	function Call(A_Duck : in Duck_Type) return String;

 	------------------------------------------------------------
 	-- Determine type of a Duck (Over-rides Bird.Type_Name()) -
 	-- Receive: A_Duck, a Duck_Type.                          -
 	-- Return: "Duck".                                        -
 	-----------------------------------------------------------
	function Type_Name(A_Duck : in Duck_Type) return String;

private

	-- Declare Duck_Type record in the private section
	-- and to inherit FlyingBird_Type details as well
	type Duck_Type is new FlyingBird_Type with
	record
		null;
	end record;

end Duck_Package;
elc3@boole:~/Documents/214/code/projects/project10/Ada$ cat duck_package.adb
-- duck_package.adb gives Duck-related definitions
--  by over-riding Bird-related definitions.
--
-- Begun by: Dr. Adams, CS 214 at Calvin College.
-- Completed by: Ethan Clark Project10
-- Date: April 26, 2016
---------------------------------------------------

with Ada.Text_IO;
use Ada.Text_IO;

package body Duck_Package is

 	----------------------------------------------------
 	-- A Duck's Call (Over-rides Bird.Call())          -
 	-- Receive: A_Duck, a Duck_Type.                   -
 	-- Return: "Quack!"                                -
 	----------------------------------------------------
	function Call(A_Duck : in Duck_Type) return String is
	begin
		return "Quack!";
	end Call;


 	------------------------------------------------------------
 	-- Determine type of a Duck (Over-rides Bird.Type_Name()) -
 	-- Receive: A_Duck, a Duck_Type.                          -
 	-- Return: "Duck".                                        -
 	-----------------------------------------------------------
	function Type_Name(A_Duck : in Duck_Type) return String is
	begin
		return "Duck";
	end Type_Name;


end Duck_Package;
elc3@boole:~/Documents/214/code/projects/project10/Ada$ cat goose_package.ads
-- goose_package.ads gives Goose-related declarations,
--
--  and derives Goose from Bird.
-- Begun by: Dr. Adams, CS 214 at Calvin College.
-- Completed by: Ethan Clark Project10
-- Date: April 26, 2016
---------------------------------------------------

-- Import and use FlyingBird_Package for inheritance purposes
with FlyingBird_Package; use FlyingBird_Package;

package Goose_Package is

 	type Goose_Type is new FlyingBird_Type with private;

 	----------------------------------------------------
 	-- A Goose's Call (Over-rides Bird.Call())         -
 	-- Receive: A_Goose, a Goose.                      -
 	-- Return: "Honk!"                                 -
 	----------------------------------------------------
	function Call(A_Goose : in Goose_Type) return String;

 	-----------------------------------------------------
 	-- Determine type of a Goose                        -
 	-- (Over-rides Bird.Type_Name())                    -
 	-- Receive: A_Goose, a Goose.                       -
 	-- Return: "Goose".                                 -
 	-----------------------------------------------------
	function Type_Name(A_Goose : in Goose_Type) return String;

private

	-- Declare Goose_Type record in the private section
	-- and to inherit FlyingBird_Type details as well
	type Goose_Type is new FlyingBird_Type with
	record
		null;
	end record;


end Goose_Package;
elc3@boole:~/Documents/214/code/projects/project10/Ada$ cat goose_Packag      package.adb
-- goose_package.adb gives Goose-related definitions
--  by over-riding Bird-related definitions.
--
-- Begun by: Dr. Adams, CS 214 at Calvin College.
-- Completed by: Ethan Clark Project10
-- Date: April 26, 2016
---------------------------------------------------

with Ada.Text_IO;
use Ada.Text_IO;

package body Goose_Package is

 	----------------------------------------------------
 	-- A Goose's Call (Over-rides Bird.Call())         -
 	-- Receive: A_Goose, a Goose_Type.                 -
 	-- Return: "Honk!"                                 -
 	----------------------------------------------------
	function Call(A_Goose : in Goose_Type) return String is
	begin
		return "Honk!";
	end Call;

 	-----------------------------------------------------
 	-- Determine type of a Goose                        -
 	-- (Over-rides Bird.Type_Name())                    -
 	-- Receive: A_Goose, a Goose_Type.                  -
 	-- Return: "Goose".                                 -
 	-----------------------------------------------------
	function Type_Name(A_Goose : in Goose_Type) return String is
	begin
		return "Goose";
	end Type_Name;


end Goose_Package;
elc3@boole:~/Documents/214/code/projects/project10/Ada$ cat owl_package.ads
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
elc3@boole:~/Documents/214/code/projects/project10/Ada$ cat owl_package.adb
-- owl_package.adb gives Owl-related definitions
--  by over-riding Bird-related definitions.
--
-- Begun by: Dr. Adams, CS 214 at Calvin College.
-- Completed by: Ethan Clark Project10
-- Date: April 26, 2016
---------------------------------------------------

with Ada.Text_IO;
use Ada.Text_IO;

package body Owl_Package is

 	----------------------------------------------------
 	-- A Owl's Call (Over-rides Bird.Call())           -
 	-- Receive: An_Owl, an Owl_Type.                   -
 	-- Return: "Whoo!"                                 -
 	----------------------------------------------------
	function Call(A_Owl : in Owl_Type) return String is
	begin
		return "Whoot!";
	end Call;

 	-----------------------------------------------------
 	-- Determine type of a Owl                          -
 	-- (Over-rides Bird.Type_Name())                    -
 	-- Receive: An_Owl, an Owl_Type.                    -
 	-- Return: "Owl".                                   -
 	-----------------------------------------------------
	function Type_Name(A_Owl : in Owl_Type) return String is
	begin
		return "Owl";
	end Type_Name;

end Owl_Package;
elc3@boole:~/Documents/214/code/projects/project10/Ada$ cat pengi uin_pc ackage.ads
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
elc3@boole:~/Documents/214/code/projects/project10/Ada$ cat penguin_package.adb
-- penguin_package.adb gives Penguin-related definitions
--  by over-riding WalkingBird-related definitions.
--
-- Created by: Ethan Clark Project10
-- Date: April 26, 2016
---------------------------------------------------

with Ada.Text_IO;
use Ada.Text_IO;

package body Penguin_Package is

 	----------------------------------------------------
 	-- A Penguin's Call (Over-rides Bird.Call())       -
 	-- Receive: A_Penguin, a Penguin_Type.             -
 	-- Return: "Huh-huh-huh-huuuuuh!"                  -
 	----------------------------------------------------
	function Call(A_Penguin : in Penguin_Type) return String is
	begin
		return "Huh-huh-huh-huuuuuh!";
	end Call;

 	-----------------------------------------------------
 	-- Determine type of a Penguin                      -
 	-- (Over-rides Bird.Type_Name())                    -
 	-- Receive: A_Penguin, a Penguin_Type.              -
 	-- Return: "Penguin".                               -
 	-----------------------------------------------------
	function Type_Name(A_Penguin : in Penguin_Type) return String is
	begin
		return "Penguin";
	end Type_Name;

end Penguin_Package;
elc3@boole:~/Documents/214/code/projects/project10/Ada$ cat ostrich_package.ads
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
elc3@boole:~/Documents/214/code/projects/project10/Ada$ cat ostrich_package.ads b
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
elc3@boole:~/Documents/214/code/projects/project10/Ada$ cat kiwi_package.ads
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
elc3@boole:~/Documents/214/code/projects/project10/Ada$ cat kiwi_package.ads b
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
elc3@boole:~/Documents/214/code/projects/project10/Ada$ cat birds.adb
-- birds.adb tests our Birds type
--
-- Begun by: Dr. Adams, CS 214 at Calvin College
-- Completed by: Ethan Clark Lab10
-- Date: April 22, 2016
-----------------------------------------------------

with Ada.Text_IO, Bird_Package, Duck_Package, Goose_Package, Owl_Package, Penguin_Package, Ostrich_Package, Kiwi_Package;
use Ada.Text_IO, Bird_Package, Duck_Package, Goose_Package, Owl_Package, Penguin_Package, Ostrich_Package, Kiwi_Package;


procedure Birds is

 	Bird1 : Bird_Type;       -- base class
 	Bird2 : Duck_Type;       -- derived class 1
 	Bird3 : Goose_Type;      -- derived class 2
 	Bird4 : Owl_Type;        -- derived class 3
	Bird5 : Penguin_Type;	 -- derived class 4
	Bird6 : Ostrich_Type;    -- derived class 5
	Bird7 : Kiwi_Type;	 -- derived class 6

begin
	Init(Bird1, "Tweety");
	Put(Bird1); New_Line;

	Init(Bird2, "Donald");
	Put(Bird2); New_Line;

	Init(Bird3, "Mother");
	Put(Bird3); New_Line;

	Init(Bird4, "Woodsy");
	Put(Bird4); New_Line;

	Init(Bird5, "Alfred");
	Put(Bird5); New_Line;

	Init(Bird6, "Collin");
	Put(Bird6); New_Line;

	Init(Bird7, "Janell");
	Put(Bird7); New_Line;

 	New_Line;
end Birds;

elc3@boole:~/Documents/214/code/projects/project10/Ada$ gnatmake birds.adb
gcc-4.8 -c birds.adb
gcc-4.8 -c duck_package.adb
gcc-4.8 -c goose_package.adb
gcc-4.8 -c kiwi_package.adb
gcc-4.8 -c ostrich_package.adb
gcc-4.8 -c owl_package.adb
gcc-4.8 -c penguin_package.adb
gcc-4.8 -c flyingbird_package.adb
gcc-4.8 -c walkingbird_package.adb
gnatbind -x birds.ali
gnatlink birds.ali
elc3@boole:~/Documents/214/code/projects/project10/Ada$ ./birds
Tweety Bird just moved and said Squawwwwwwwwwk!
Donald Duck just flew and said Quack!
Mother Goose just flew and said Honk!
Woodsy Owl just flew and said Whoot!
Alfred Penguin just walked and said Huh-huh-huh-huuuuuh!
Collin Ostrich just walked and said Snork!
Janell Kiwi just walked and said Victory!

elc3@boole:~/Documents/214/code/projects/project10/Ada$ exit

Script done on Tue 26 Apr 2016 07:51:38 PM EDT
