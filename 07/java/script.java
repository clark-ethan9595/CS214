Script started on Tue 05 Apr 2016 06:34:27 PM EDT
elc3@atanasoff:~/Documents/214/code/07/java$ java -cp /usr/share/java/junit4-4.11.jar:. TestRunnerc -cp /usr/share/java/junit4-4.11.jar:. TestRunner.javaelc3@atanasoff:~/Documents/214/code/07/java$ cat NamerTest.java[K[1@TestRunner.java[6PName.java
/* Name.java implements class Name.
 *
 * Begun by: Dr. Nelesen, CS 214 at Calvin College.
 * Completed by: Ethan Clark lab7
 * Date: March 31, 2016
 */

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
    
}
elc3@atanasoff:~/Documents/214/code/07/java$ cat Name.javajava -cp /usr/share/java/junit4-4.11.jar:. TestRunnerc -cp /usr/share/java/junit4-4.11.jar:. TestRunner.javaelc3@atanasoff:~/Documents/214/code/07/java$ cat NamerTest.java[K[1@TestRunner.java
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



elc3@atanasoff:~/Documents/214/code/07/java$ cat TestRunner.java[6PName.javajava -cp /usr/share/java/junit4-4.11.jar:. TestRunnerc -cp /usr/share/java/junit4-4.11.jar:. TestRunner.javaelc3@atanasoff:~/Documents/214/code/07/java$ cat NamerTest.java[K
/* A class to test the Name class
 * Created by: Dr. Nelesen
 *
 */

import org.junit.Test;
import static org.junit.Assert.*;


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
}

elc3@atanasoff:~/Documents/214/code/07/java$ cat NamerTest.java[1@TestRunner.java[6PName.javajava -cp /usr/share/java/junit4-4.11.jar:. TestRunnerc -cp /usr/share/java/junit4-4.11.jar:. TestRunner.java
elc3@atanasoff:~/Documents/214/code/07/java$ javac -cp /usr/share/java/junit4-4.11.jar:. TestRunner.javaelc3@atanasoff:~/Documents/214/code/07/java$ cat NamerTest.java[K[1@TestRunner.java[6PName.javajava -cp /usr/share/java/junit4-4.11.jar:. TestRunner
John Paul Jones
All tests passed!
elc3@atanasoff:~/Documents/214/code/07/java$ exit

Script done on Tue 05 Apr 2016 06:34:46 PM EDT
