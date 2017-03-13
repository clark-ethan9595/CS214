Script started on Fri 22 Apr 2016 09:04:07 AM EDT
elc3@boole:~/Documents/214/code/10/ada$ cat bird_package.adb
-- bird_package.adb gives Bird-related definitions
--
-- Begun by: Dr. Adams, CS 214 at Calvin College.
-- Completed by: Ethan Clark Lab10
-- Date: April 22, 2016
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
 	-- Output a Bird                                   -
 	-- Receive: A_Bird, a Bird or subclass of Bird.    -
 	-- Output: Everything known about A_Bird           -
 	----------------------------------------------------
	procedure Put(A_Bird : in Bird_Type'Class) is
	begin
		Put( Name(A_Bird) );
		Put( ' ' );
		Put( Type_Name(A_Bird) );
		Put( " says " );
		Put( Call(A_Bird) );
	end Put;

end Bird_Package;

elc3@boole:~/Documents/214/code/10/ada$ cat Bir   bird_package.ads
-- bird_package.ads gives Bird-related declarations
--
-- Begun by: Dr. Adams, for CS 214 at Calvin College.
-- Completed by: Ethan Clark Lab10
-- Date: April 22, 2016
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

private

	-- Declare the private Bird_Type record
	type Bird_Type is tagged record
		My_Name : String(1..6);
	end record;

end Bird_Package;
elc3@boole:~/Documents/214/code/10/ada$ cat duck_package.adb
-- duck_package.adb gives Duck-related definitions
--  by over-riding Bird-related definitions.
--
-- Begun by: Dr. Adams, CS 214 at Calvin College.
-- Completed by: Ethan Clark Lab10
-- Date: April 22, 2016
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
elc3@boole:~/Documents/214/code/10/ada$ cat duck_package.ads
-- duck_package.ads gives Duck-related declarations,
--
--  and derives Duck from Bird.
-- Begun by: Dr. Adams, CS 214 at Calvin College.
-- Completed by: Ethan Clark Lab10
-- Date: April 22, 2016
---------------------------------------------------

with Bird_Package; use Bird_Package;

package Duck_Package is

	type Duck_Type is new Bird_Type with private;

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
	-- and to inherit Bird_Type details as well
	type Duck_Type is new Bird_Type with
	record
		null;
	end record;

end Duck_Package;
elc3@boole:~/Documents/214/code/10/ada$ cat Goo   goose_package.adb
-- goose_package.adb gives Goose-related definitions
--  by over-riding Bird-related definitions.
--
-- Begun by: Dr. Adams, CS 214 at Calvin College.
-- Completed by: Ethan Clark Lab10
-- Date: April 22, 2016
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
elc3@boole:~/Documents/214/code/10/ada$ cat goose_package.ads
-- goose_package.ads gives Goose-related declarations,
--
--  and derives Goose from Bird.
-- Begun by: Dr. Adams, CS 214 at Calvin College.
-- Completed by: Ethan Clark Lab10
-- Date: April 22, 2016
---------------------------------------------------

with Bird_Package; use Bird_Package;

package Goose_Package is

 	type Goose_Type is new Bird_Type with private;

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
	-- and to inherit Bird_Type details as well
	type Goose_Type is new Bird_Type with
	record
		null;
	end record;


end Goose_Package;
elc3@boole:~/Documents/214/code/10/ada$ cat owl_Pa  p[ ackage.ads
-- owl_package.ads gives Owl-related declarations,
--  and derives Owl from Bird.
--
-- Begun by: Dr. Adams, CS 214 at Calvin College.
-- Completed by: Ethan Clark Lab10
-- Date: April 22, 2016
---------------------------------------------------

with Bird_Package; use Bird_Package;

package Owl_Package is

	type Owl_Type is new Bird_Type with private;

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
	-- and to inherit Bird_Type details as well
	type Owl_Type is new Bird_Type with
	record
		null;
	end record;


end Owl_Package;
elc3@boole:~/Documents/214/code/10/ada$ cat owl_pak ckage.ads b
-- owl_package.adb gives Owl-related definitions
--  by over-riding Bird-related definitions.
--
-- Begun by: Dr. Adams, CS 214 at Calvin College.
-- Completed by: Ethan Clark Lab10
-- Date: April 22, 2016
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
elc3@boole:~/Documents/214/code/10/ada$ cat Birds     birds.adb
-- birds.adb tests our Birds type
--
-- Begun by: Dr. Adams, CS 214 at Calvin College
-- Completed by: Ethan Clark Lab10
-- Date: April 22, 2016
-----------------------------------------------------

with Ada.Text_IO, Bird_Package, Duck_Package, Goose_Package, Owl_Package;
use Ada.Text_IO, Bird_Package, Duck_Package, Goose_Package, Owl_Package;


procedure Birds is

 	Bird1 : Bird_Type;       -- base class
 	Bird2 : Duck_Type;       -- derived class 1
 	Bird3 : Goose_Type;      -- derived class 2
 	Bird4 : Owl_Type;        -- derived class 3

begin
	Init(Bird1, "Tweety");
	Put(Bird1); New_Line;

	Init(Bird2, "Donald");
	Put(Bird2); New_Line;

	Init(Bird3, "Mother");
	Put(Bird3); New_Line;

	Init(Bird4, "Woodsy");
	Put(Bird4); New_Line;

 	New_Line;
end Birds;

elc3@boole:~/Documents/214/code/10/ada$ gnatmake birds.adb
gcc-4.8 -c birds.adb
gcc-4.8 -c duck_package.adb
gnatbind -x birds.ali
gnatlink birds.ali
elc3@boole:~/Documents/214/code/10/ada$ ./birds
Tweety Bird says Squawwwwwwwwwk!
Donald Duck says Quack!
Mother Goose says Honk!
Woodsy Owl says Whoot!

elc3@boole:~/Documents/214/code/10/ada$ exit

Script done on Fri 22 Apr 2016 09:05:08 AM EDT
