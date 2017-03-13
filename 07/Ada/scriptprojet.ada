Script started on Thu 07 Apr 2016 09:12:27 AM EDT
elc3@boole:~/Documents/214/code/07$ cat namer.adb
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

  -- define charsRead for readName procedure
  charsRead : Natural;
  first, middle, last : String(1..NAME_SIZE);

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

  --------------------------------------------------
  -- setFirst(Name) updates Name.myFirst           -
  -- Receive: theName, a Name; new_first, a string -
  -- PRE: theName has been initialized.            -
  -- Return: none.                                 -
  --------------------------------------------------
  procedure setFirst(TheName: out Name; new_first: in String) is

  begin

	TheName.myFirst := new_first;

  end setFirst;

  ---------------------------------------------------
  -- setMiddle(Name) updates Name.myMiddle          -
  -- Receive: theName, a Name; new_middle, a string -
  -- PRE: theName has been initialized.             -
  -- Return: none.                                  -
  ---------------------------------------------------
  procedure setMiddle(TheName: out Name; new_middle: in String) is

  begin

	TheName.myMiddle := new_middle;

  end setMiddle;

  -------------------------------------------------
  -- setLast(Name) updates Name.myLast            -
  -- Receive: theName, a Name; new_last, a string -
  -- PRE: theName has been initialized.           -
  -- Return: none.                                -
  -------------------------------------------------
  procedure setLast(TheName: out Name; new_last: in String) is

  begin

	TheName.myLast := new_last;

  end setLast;

  -----------------------------------------------------------------
  -- lfmi() returns the name in the LastFirstMiddleInitial format -
  -- Receive: theName, a Name                                     -
  -- PRE: theName has been initialized.                           -
  -- Return: the name in the LastFirstMiddleInitial format        -
  -----------------------------------------------------------------
  function lfmi(TheName: in Name) return String is

  begin

	return TheName.myLast & " " & TheName.myFirst & " " & TheName.myMiddle(TheName.myMiddle'First) & ".";

  end lfmi;

  ----------------------------------------------------------------------------------------
  -- readName() reads in names from the user to use as the first, middle, and last names -
  -- Receive: theName, a Name                                                            -
  -- PRE: none, theName does not have to be initialized                                  -
  -- Return: None                                                                        -
  ----------------------------------------------------------------------------------------
  procedure readName(TheName: out Name) is

  begin

	Put( "Please enter the new first name: ");
	Get_Line(first, charsRead);
	TheName.myFirst := first;

	Put( "Please enter the new middle name: ");
	Get_Line(middle, charsRead);
	TheName.myMiddle := middle;

	Put( "Please enter the new last name: ");
	Get_Line(last, charsRead);
	TheName.myLast := last;

  end readName;

begin

   -- Create an instance of the Name record called aName
   Init(aName, "John    ", "Paul    ", "Jones   ");

   -- Test each Name record procedure or function here through assertions
   pragma Assert( getFirst(aName) = "John    ", "getFirst() failed");
   pragma Assert( getMiddle(aName) = "Paul    ", "getMiddle() failed");
   pragma Assert( getLast(aName) = "Jones   ", "getLast() failed");
   pragma Assert( getFullName(aName) = "John     Paul     Jones   ", 
                    "getFullName() failed");

   -- NEW ASSERTION FOR PROJECT7
   pragma Assert( lfmi(aName) = "Jones   John    P.", "lfmi() failed");

   Put(aName); New_line;

   -- Test the new mutator functions for the type Name
   -- NEW ASSERTIONS FOR PROJECT7
   setFirst(aName, "Ethan   ");
   pragma Assert( getFirst(aName) = "Ethan   ", "setFirst() failed");

   setMiddle(aName, "Levi    ");
   pragma Assert( getMiddle(aName) = "Levi    ", "setMiddle() failed");

   setLast(aName, "Clark   ");
   pragma Assert( getLast(aName) = "Clark   ", "setLast() failed");

   Put(aName); New_line;

   -- Test the new lfmi function on the type Name
   -- NEW ASSERTION FOR PROJECT7
   pragma Assert( lfmi(aName) = "Clark   Ethan   L.", "lfmi() failed");

   -- Test the new readName procedure on the type Name
   -- NEW ASSERTION FOR PROJECT7
   readName(aName);
   pragma Assert( getFullName(aName) /= "Ethan   Levi    Clark   ", "readName() did not change record values");
   Put(aName); New_line;

   -- If all tests pass...
   Put("All tests passed!"); New_line;

end namer;

elc3@boole:~/Documents/214/code/07$ gnatmake namer.adb
gcc-4.6 -c namer.adb
gnatbind -x namer.ali
gnatlink namer.ali
elc3@boole:~/Documents/214/code/07$ ./namer
John     Paul     Jones   
Ethan    Levi     Clark   
Please enter the new first name: Mark
Please enter the new middle name: Austin
Please enter the new last name: Davis
Mark     Austin   Davis   
All tests passed!
elc3@boole:~/Documents/214/code/07$ exit

Script done on Thu 07 Apr 2016 09:12:58 AM EDT
