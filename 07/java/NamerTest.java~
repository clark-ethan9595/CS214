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

