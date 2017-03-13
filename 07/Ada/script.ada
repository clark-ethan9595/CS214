Script started on Tue 05 Apr 2016 06:37:08 PM EDT
elc3@atanasoff:~/Documents/214/code/07$ cat namer.adb
-- namer.adb "test-drives" the Name type.
-- Begun by: Dr. Adams, CS 214 at Calvin College.
-- Completed by: Ethan Clark lab7
-- Date: March 31, 2016
----------------------------------------------

with Ada.Text_IO; use Ada.Text_IO;

procedure namer is

  -- define a constant for the size/length of each first, middle, and last names
  NAME_SIZE : constant := 8;

  -- declare the Name type as a record with Strings myFirst, myMiddle, myLast
  type Name is record
	myFirst, myMiddle, myLast : String(1..NAME_SIZE);
  end record;

  -- define aName to be of type Name
  aName : Name ;

  ----------------------------------------------
  -- Init initializes a Name variable          -
  -- Receive: theName, the Name variable;      -
  --          First, the first name;           -
  --          Middle, the middle name;         -
  --          Last, the last name.             -
  -- Return: theName, its fields set to First, -
  --               Middle, and Last.           -
  ----------------------------------------------

  procedure Init (TheName: out Name; First, Middle, Last : in String) is

  begin

	TheName.MyFirst := First;
	TheName.MyMiddle := Middle;
	TheName.MyLast := Last;

  end Init;


  ----------------------------------------------
  -- getFirst(Name) retrieves Name.myFirst     -
  -- Receive: theName, a Name.                 -
  -- PRE: theName has been initialized.        -
  -- Return: theName.myFirst.                  -
  ----------------------------------------------

  function getFirst(TheName: in Name) return String is

  begin

	return TheName.MyFirst;

  end getFirst;


  ----------------------------------------------
  -- getMiddle(Name) retrieves Name.myMiddle   -
  -- Receive: theName, a Name.                 -
  -- PRE: theName has been initialized.        -
  -- Return: theName.myMiddle.                 -
  ----------------------------------------------

  function getMiddle(TheName: in Name) return String is

  begin

	return TheName.MyMiddle;

  end getMiddle;


  ----------------------------------------------
  -- getLast(Name) retrieves Name.myLast       -
  -- Receive: theName, a Name.                 -
  -- PRE: theName has been initialized.        -
  -- Return: theName.myLast.                   -
  ----------------------------------------------

  function getLast(TheName: in Name) return String is

  begin

	return TheName.MyLast;

  end getLast;


  -----------------------------------------------
  -- getFullName(Name) retrieves Name as a String  -
  -- Receive: theName, a Name.                  -
  -- PRE: theName has been initialized.         -
  -- Return: a String representation of theName -
  -----------------------------------------------

  function getFullName(TheName: in Name) return String is

  begin
	
	return TheName.MyFirst & " " & TheName.MyMiddle & " " & TheName.MyLast;

  end getFullName;

  ----------------------------------------------
  -- Put(Name) displays a Name value.          -
  -- PRE: theName has been initialized.        -
  -- Receive: theName, a Name.                 -
  -- Output: theName, to the screen.           -
  ----------------------------------------------

  procedure Put(TheName: in Name) is

  begin

	Put( TheName.MyFirst & " " & TheName.MyMiddle & " " & TheName.MyLast );

  end Put;


begin

   -- Create an instance of the Name record called aName
   Init(aName, "John    ", "Paul    ", "Jones   ");

   -- Test each Name record procedure or function here through assertions
   pragma Assert( getFirst(aName) = "John    ", "getFirst() failed");
   pragma Assert( getMiddle(aName) = "Paul    ", "getMiddle() failed");
   pragma Assert( getLast(aName) = "Jones   ", "getLast() failed");
   pragma Assert( getFullName(aName) = "John     Paul     Jones   ", 
                    "getFullName() failed");

   Put(aName); New_line;

   -- If all tests pass...
   Put("All tests passed!"); New_line;

end namer;

elc3@atanasoff:~/Documents/214/code/07$ gnatmake namer.adb
gcc-4.6 -c namer.adb
gnatbind -x namer.ali
gnatlink namer.ali
elc3@atanasoff:~/Documents/214/code/07$ ./namer
John     Paul     Jones   
All tests passed!
elc3@atanasoff:~/Documents/214/code/07$ exit

Script done on Tue 05 Apr 2016 06:37:23 PM EDT
