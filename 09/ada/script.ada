Script started on Mon 18 Apr 2016 08:56:33 PM EDT
elc3@hollerith:~/Documents/214/code/09/ada$ cat list_+ package.ads
-- list_package.ads declares an Ada linked list and its operations.
--
-- Begun by: Dr. Adams, CS 214 at Calvin College.
-- Completed by: Ethan Clark Lab9
-- Date: April 18, 2016
------------------------------------------------------------------

package List_Package is

  -- the list-type itself (public)
  type List is private;

  -----------------------------------------------------
  -- Initialize a list                                -
  -- Receive: aList, a List.                          -
  -- Pre: aList is uninitialized.                     -
  -- Post: aList%itsFirst == aList%itsLast == NULL && -
  --        aList%itsLength == 0.                     -
  -----------------------------------------------------
  procedure Init(A_List: out List);


  ------------------------------------------------
  -- Is a list empty?                            -
  -- Receive: aList, a List.                     -
  -- Return: true, iff aList contains no values. -
  ------------------------------------------------
  function Empty(A_List: in List) return Boolean;

  -------------------------------------
  -- How many values are in a list?   -
  -- Receive: aList, a List.          -
  -- Return: aList%itsLength.         -
  -------------------------------------
  function Length(A_List : in List) return Integer;


  ----------------------------------------
  -- Append a value to a list.           -
  -- Receive: aValue, an integer,        -
  -- Passback: aList, containing aValue. -
  ----------------------------------------
  procedure Append(A_Value : in Integer; A_List: in out List);


  -------------------------------------
  -- Display the values in a list.    -
  -- Receive: aList, a List.          -
  -- Output: the values in aList.     -
  -------------------------------------
  procedure Put(A_List : in List);

  ---------------------------------------
  -- Find the maximum value in a list.  -
  -- Receive: aList, a List.            -
  -- Return: the maximum value in aList.-
  ---------------------------------------
  function Max(A_List: in List) return Integer;

 private

   -- Place the declaration of List_Node here to use in the Node_Ptr declaration
   type List_Node;

   -- Declare the Node_Ptr type
   type Node_Ptr is access List_Node;

   -- Declare the List_Node type with Its_Value and Its_Next
   type List_Node is record
	Its_Value : Integer;
	Its_Next : Node_Ptr;
   end record;

   -- Declare the List type with Its_First, Its_Last, and Its_Length
   type List is record
	Its_First : Node_Ptr;
	Its_Last : Node_Ptr;
	Its_Length : Integer;
   end record;

end List_Package;

elc3@hollerith:~/Documents/214/code/09/ada$ cat list_package.adb
-- list_package.adb defines Ada linked list operations.
--
-- Begun by: Dr. Adams, CS 214 at Calvin College.
-- Completed by: Ethan Clark Lab8
-- Date: April 18, 2016
-------------------------------------------------------

with Ada.Text_IO, Ada.Integer_Text_IO;
use Ada.Text_IO, Ada.Integer_Text_IO;

package body List_Package is

  -----------------------------------------------------
  -- Initialize a list                                -
  -- Receive: aList, a List.                          -
  -- Pre: aList is uninitialized.                     -
  -- Post: aList%itsFirst == aList%itsLast == NULL && -
  --        aList%itsLength == 0.                     -
  -----------------------------------------------------
  procedure Init(A_List : out List) is
  begin
    A_List.Its_First := null;
    A_List.Its_Last := null;
    A_List.Its_Length := 0;
  end Init;

  ------------------------------------------------
  -- Is a list empty?                            -
  -- Receive: aList, a List.                     -
  -- Return: true, iff aList contains no values. -
  ------------------------------------------------
  function Empty(A_List : in List) return Boolean is
  begin
    return A_List.Its_Length = 0;
  end Empty;

  -------------------------------------
  -- How many values are in a list?   -
  -- Receive: aList, a List.          -
  -- Return: aList%itsLength.         -
  -------------------------------------
  function Length(A_List : in List) return Integer is
  begin
    return A_List.Its_Length;
  end Length;

  ----------------------------------------
  -- Append a value to a list.           -
  -- Receive: aValue, an integer,        -
  -- Passback: aList, containing aValue. -
  ----------------------------------------
  procedure Append(A_Value : in Integer; A_List : in out List) is
    Temp_Ptr : constant Node_Ptr := new List_Node;
  begin
    Temp_Ptr.Its_Value := A_Value;
    Temp_Ptr.Its_Next := null;

    if A_List.Its_Length = 0 then
       A_List.Its_First := Temp_Ptr;
    else
       A_List.Its_Last.Its_Next := Temp_Ptr;
    end if;

    A_List.Its_Last := Temp_Ptr;

    A_List.Its_Length := A_List.Its_Length + 1;
  end Append;

  -------------------------------------
  -- Display the values in a list.    -
  -- Receive: aList, a List.          -
  -- Output: the values in aList.     -
  -------------------------------------

  procedure Put(A_List: in List) is

  -- Declare Temp_Ptr before the procedure begins
  Temp_Ptr: Node_Ptr := A_List.Its_First;

  begin

	-- While Temp_Ptr is not null (has not reached end of A_List)
	while Temp_Ptr /= null loop

		-- Output the Value of the Temp_Ptr
		Put(' '); Put(Temp_Ptr.Its_Value);

		-- Update to the next Ptr/element in A_List
		Temp_Ptr := Temp_Ptr.Its_Next;

	end loop;

  end Put;

  ---------------------------------------
  -- Find the maximum value in a list.  -
  -- Receive: aList, a List.            -
  -- PRE: aList is not empty            -
  -- Return: the maximum value in aList.-
  ---------------------------------------

  function Max(A_List: in List) return Integer is

  -- Declare Temp_Ptr, Max_Int before the function begins
  Temp_Ptr: Node_Ptr := A_List.Its_First;
  Max_Int: Integer := -99999999;

  begin

	-- While Temp_Ptr is not null (has not reached end of A_List)
	while Temp_Ptr /= null loop

		-- If the Temp_Ptr Value is bigger than our current Max_Int value
		if Temp_Ptr.Its_Value > Max_Int then

			-- Make the Temp_Ptr value the new Max_Int
			Max_Int := Temp_Ptr.Its_Value;

		end if;

		-- Updated to the next Ptr/element in the List
		Temp_Ptr := Temp_Ptr.Its_Next;

	end loop;

	-- Return the Max_Int
	return Max_Int;

  end Max;

end List_Package;

elc3@hollerith:~/Documents/214/code/09/ada$ cat max.adb
-- max.adb finds the max of a list of integers. 
-- 
-- Begun by: Dr. Adams, CS 214 at Calvin College.
-- Completed by: Ethan Clark Lab9
-- Date: April 18, 2016
-------------------------------------------------- 
 
with Ada.Text_IO, Ada.Integer_Text_IO, List_Package; 
use Ada.Text_IO, Ada.Integer_Text_IO, List_Package; 
 
procedure Max is 
                              -- define 3 lists 
  List1, List2, List3 : List; 
  --Temp_Ptr : Node_Ptr;	-- Experiment testing
 
begin 
  Init(List1);                -- initialize them 
  Init(List2); 
  Init(List3); 
 
  Append(99, List1);          -- 99, 88, 77, 66, 55 
  Append(88, List1);          -- max is first 
  Append(77, List1); 
  Append(66, List1); 
  Append(55, List1); 
 
  Append(55, List2);          -- 55, 66, 77, 88, 99 
  Append(66, List2);          -- max is last 
  Append(77, List2); 
  Append(88, List2); 
  Append(99, List2); 
 
  Append(55, List3);          -- 55, 77, 99, 88, 66 
  Append(77, List3);          -- max is in the middle 
  Append(99, List3); 
  Append(88, List3); 
  Append(66, List3); 
 
  Put(List1); New_Line;       -- output the 3 lists 
  Put(List2); New_Line; 
  Put(list3); New_Line; 
                              -- display their maxima 
  Put("The maximum value in list 1 is ");  Put( Max(List1) ); New_Line; 
  Put("The maximum value in list 2 is ");  Put( Max(List2) ); New_Line; 
  Put("The maximum value in list 3 is ");  Put( Max(List3) ); New_Line; 


  ---------------------------------------------------------------------
  -- The program throws an error saying Node_Ptr is not visible
  -- 	referencing that is in the priviate section of list_package.ads.
  ----------------------------------------------------------------------

end Max; 

elc3@hollerith:~/Documents/214/code/09/ada$ gnatmake max.adb
gcc-4.8 -c max.adb
gcc-4.8 -c list_package.adb
gnatbind -x max.ali
gnatlink max.ali
elc3@hollerith:~/Documents/214/code/09/ada$ ./max
          99          88          77          66          55
          55          66          77          88          99
          55          77          99          88          66
The maximum value in list 1 is          99
The maximum value in list 2 is          99
The maximum value in list 3 is          99
elc3@hollerith:~/Documents/214/code/09/ada$ exit

Script done on Mon 18 Apr 2016 08:56:58 PM EDT
