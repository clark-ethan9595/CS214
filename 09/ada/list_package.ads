-- list_package.ads declares an Ada linked list and its operations.
--
-- Begun by: Dr. Adams, CS 214 at Calvin College.
-- Completed by: Ethan Clark Project9
-- Date: April 19, 2016
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

  ------------------------------------------------------------------------------------
  -- Search(aList, element) searches for element in aList and returns its position  --
  -- Receive: aList, a List; element, an integer                                    --
  -- PRE: aList has already been defined                                            --
  -- Return: integer index/position of element in aList; -1 if not in aList         --
  ------------------------------------------------------------------------------------
  function Search(aList: in List; element: in Integer) return Integer;

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

