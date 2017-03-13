Script started on Thu 07 Apr 2016 09:13:33 AM EDT
elc3@boole:~/Documents/214/code/07/java$ cat Name.java
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
elc3@boole:~/Documents/214/code/07/java$ cat NamerTest.java
/* A class to test the Name class
 * Created by: Dr. Nelesen
 *
 */

import org.junit.Test;
import static org.junit.Assert.*;
import java.util.Scanner;


public class NamerTest  // a class used for JUnit testing...
{
    @Test
    public void testToString() {
	Name theName = new Name("John", "Paul", "Jones");
	assertEquals(theName.toString(), "John Paul Jones");
    }
    
    @Test
    public void testGetFirst(){
	Name theName = new Name("Johnna", "Paulina", "Jones");
	assertEquals(theName.getFirst(), "Johnna");
    }

    @Test
    public void testGetMiddle(){
	Name theName = new Name("Johnna", "Grace", "Jones");
	assertEquals(theName.getMiddle(), "Grace");
    }

    @Test
    public void testGetLast(){
	Name theName = new Name("Johnna", "Paulina", "Jones");
	assertEquals(theName.getLast(), "Jones");
    }

    @Test
    public void testSetFirst(){
	Name theName = new Name("Johnna", "Paulina", "Jones");
	assertEquals(theName.getFirst(), "Johnna");
	theName.setFirst("Emily");
	assertEquals(theName.getFirst(), "Emily");
    }	

    @Test
    public void testSetMiddle(){
	Name theName = new Name("Johnna", "Paulina", "Jones");
	assertEquals(theName.getMiddle(), "Paulina");
	theName.setMiddle("Christine");
	assertEquals(theName.getMiddle(), "Christine");
    }

    @Test
    public void testSetLast(){
	Name theName = new Name("Johnna", "Paulina", "Jones");
	assertEquals(theName.getLast(), "Jones");
	theName.setLast("Smith");
	assertEquals(theName.getLast(), "Smith");
    }

    @Test
    public void testlfmi(){
	Name theName = new Name("Johnna", "Paulina", "Jones");
	assertEquals(theName.lfmi(), "Jones Johnna P.");
    }

    @Test
    public void testReadName(){
	Name theName = new Name("Johnna", "Paulina", "Jones");
	assertEquals(theName.toString(), "Johnna Paulina Jones");
	Scanner keyboard = new Scanner(System.in);
	theName.readName(keyboard);
	System.out.println(theName.toString());
    }
}

elc3@boole:~/Documents/214/code/07/java$ cat TestRunner.java
/* NamerTest.java implements and tests class Name.
 * Created by: Dr. Nelesen
 ************************************************************/
import org.junit.runner.Result;
import org.junit.runner.JUnitCore;
import org.junit.runner.notification.Failure;

public class TestRunner{
    public static void main(String[] args) {

	Name aName = new Name("John", "Paul", "Jones");
	System.out.println(aName);
	
	//Commented out for first testing...

	// Class file for test class must be referenced in next line
	Result result = JUnitCore.runClasses(NamerTest.class);

	// Print information for each test that fails
	for (Failure failure : result.getFailures()) {
	    System.out.println(failure.toString());
	}

	//Print summative information
	if (result.wasSuccessful()){
	    System.out.println("All tests passed!");
	}
	else {
	    System.out.println("At least one test failed");
	}
    }
}



elc3@boole:~/Documents/214/code/07/java$ javac -cp /usr/share/java/junit[Kelc3@boole:~/Documents/214/code/07/java$ javac -cp /usr/share/java/junit4-4.11.jar:. TestRunner.java
elc3@boole:~/Documents/214/code/07/java$ java -cp /usr/share/java/junit4-4.11.jar:. TestRunner.java     
John Paul Jones
Please give the new first name: 
Ethan
Please give the new middle name: 
Levi
Please give the new last name: 
Clark
Ethan Levi Clark
All tests passed!
elc3@boole:~/Documents/214/code/07/java$ exit

Script done on Thu 07 Apr 2016 09:16:11 AM EDT
