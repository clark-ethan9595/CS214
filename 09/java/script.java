Script started on Mon 18 Apr 2016 07:02:40 PM EDT
elc3@hollerith:~/Documents/214/code/09/java$ cat Max.java
/* Max.java uses the Java Collection Framework
 * to explore operations on a linked list
 *
 * Begun By: Serita Nelesen
 * Completed By: Ethan Clark
 * Date: April 18, 2016
 */

import java.util.LinkedList;
import java.util.Iterator;
import java.util.Collections;

// class Max uses operations on a LinkedList
class Max{

    /****************************************************************************
    * print(aList) receives a linked list and prints out the integers within in *
    * Receive: aList, a LinkedList of integers                                  *
    * Output: each integer in the list is outputted to the user                 *
    ****************************************************************************/
    public static void print(LinkedList<Integer> aList)
    {
	Iterator<Integer> listIterator = aList.iterator();
	while(listIterator.hasNext())
	{
		System.out.print(listIterator.next() + " ");
	}
	System.out.print('\n');
    }
    
    public static void main(String [] args){

	// Declare and allocate storage for three new lists
	LinkedList<Integer> list1 = new LinkedList<Integer>();
	LinkedList<Integer> list2 = new LinkedList<Integer>();
	LinkedList<Integer> list3 = new LinkedList<Integer>();

	
	list1.add(new Integer(99)); // max is first
	list1.add(new Integer(88)); // 99 88 77 66 55
	list1.add(new Integer(77));
	list1.add(new Integer(66));
	list1.add(new Integer(55));

	list2.add(55);  // max is last
	list2.add(66);  // uses implicit type conversion of int
	list2.add(77);  //     to Integer
	list2.add(88);  // 55 66 77 88 99
	list2.add(99);

	list3.add(55);  // max is in the middle
	list3.add(77);  // implicit type conversion
	list3.add(99);  // 55 77 99 88 66 
	list3.add(88);
	list3.add(66);

	print(list1);
	print(list2);
	print(list3);

	// Print out the max of each of the three lists
	System.out.println("Max of list1: " + Collections.max(list1));
	System.out.println("Max of list2: " + Collections.max(list2));
	System.out.println("Max of list3: " + Collections.max(list3));
    
    }
}
elc3@hollerith:~/Documents/214/code/09/java$ javac Max.java
elc3@hollerith:~/Documents/214/code/09/java$ java Max
99 88 77 66 55 
55 66 77 88 99 
55 77 99 88 66 
Max of list1: 99
Max of list2: 99
Max of list3: 99
elc3@hollerith:~/Documents/214/code/09/java$ exit

Script done on Mon 18 Apr 2016 07:02:55 PM EDT
