/* Name.java implements class Name.
 *
 * Begun by: Dr. Nelesen, CS 214 at Calvin College.
 * Completed by: Ethan Clark lab7
 * Date: March 31, 2016
 */

import java.util.Scanner;

class Name
{

    private String myFirst, myMiddle, myLast;
 
    /***************************************************
     * Name constructs a name from three strings.      *
     * Receive: first, middle and last, three strings. *
     * Return: the triplet (first middle last).        *
     ***************************************************/
    
    public Name(String first, String middle, String last)
    {
	myFirst = first;
	myMiddle = middle;
	myLast = last;
    }
 
    /********************************************************
     * getFirst() extracts the first name of a Name object. *
     * Return: myFirst.                                     *
     ********************************************************/
    
    public String getFirst()
    {
	return myFirst;
    }
    
    /**********************************************************
     * getMiddle() extracts the middle name of a Name object. *
     * Return: myMiddle.                                      *
     **********************************************************/
    
    public String getMiddle()
    {
	return myMiddle;
    }
    
    /*******************************************************
     * getLast() extracts the last name of a Name object.  *
     * Return: myLast.                                     *
     *******************************************************/
    
    public String getLast()
    {
	return myLast;
    }
    
    /*****************************************************
     * getFullName() returns a full name in F-M-L order. *
     * Return: myFirst, myMiddle, myLast.                *
     *****************************************************/
    
    // Replace this line with the getFullName() definition
    // From my understanding of the lab instructions...
    // we do not need to create this function???
    
    
    /****************************************************
     * toString() displays a Name object.               *
     * Output: a String version of the name.            *
     ****************************************************/
    public String toString()
    {
	return myFirst + " " + myMiddle + " " + myLast;
    }


     /*******************************************************
     * setFirst() updates the myFirst for the Name class    *
     * Return: none                                         *
     *******************************************************/
    public void setFirst(String new_first)
    {
	myFirst = new_first;
    }

     /*******************************************************
     * setMiddle() updates the myMiddle for the Name class  *
     * Return: none                                         *
     *******************************************************/
   public void setMiddle(String new_middle)
    {
	myMiddle = new_middle;
    }

     /*******************************************************
     * setLast() updates the myLast for the Name class      *
     * Return: none                                         *
     *******************************************************/
   public void setLast(String new_last)
    {
	myLast = new_last;
    }
    
   /*******************************************************************
   * lmfi() displays the name in the Last-First-MiddleInitial format  *
   * Return: a String version of the name in this format              *
   *******************************************************************/
   public String lfmi()
   {
	return myLast + " " + myFirst + " " + myMiddle.charAt(0) + ".";
   }

   /****************************************************************
   * readName() receives a Scanner to receive input from the user  *
   * Output: new myFirst, myMiddle, and myLast String values       *
   ****************************************************************/
   public void readName(Scanner keyboard)
   {
	System.out.println("Please give the new first name: ");
	myFirst = keyboard.next();

	System.out.println("Please give the new middle name: ");
	myMiddle = keyboard.next();

	System.out.println("Please give the new last name: ");
	myLast = keyboard.next();
   }

}
