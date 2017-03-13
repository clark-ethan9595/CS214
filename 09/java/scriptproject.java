Script started on Tue 19 Apr 2016 08:26:07 PM EDT
elc3@goldberg:~/Documents/214/code/09/java$ cat Max.java
/* Max.java uses the Java Collection Framework
 * to explore operations on a linked list
 *
 * Begun By: Serita Nelesen
 * Completed By: Ethan Clark Project9
 * Date: April 19, 2016
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
    
    /*****************************************************************************
    * search(aList, element) searches for and returns index of element in aList  *
    * Receive: LinkedList, aList; int, element                                   *
    * Return: index of element in aList, else -1 if not in aList                 *
    *****************************************************************************/
    public static int search(LinkedList<Integer> aList, int element)
    {
	int index = 0;
	Iterator<Integer> listIterator = aList.iterator();
	while(listIterator.hasNext())
	{
		if (aList.get(index) == element)
			return index;
		else
		{
			index += 1;
			listIterator.next();
		}
	}
	return -1;
    }
    
    public static void main(String [] args){

	// Declare and allocate storage for three new lists
	LinkedList<Integer> list1 = new LinkedList<Integer>();
	LinkedList<Integer> list2 = new LinkedList<Integer>();
	LinkedList<Integer> list3 = new LinkedList<Integer>();
	LinkedList<Integer> list4 = new LinkedList<Integer>();

	
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

	list4.add(44);  // List where 99 is not in the list
	list4.add(55);
	list4.add(66);
	list4.add(77);
	list4.add(88);

	print(list1);
	print(list2);
	print(list3);
	print(list4);

	// Print out the max of each of the three lists
	System.out.println("Max of list1: " + Collections.max(list1));
	System.out.println("Max of list2: " + Collections.max(list2));
	System.out.println("Max of list3: " + Collections.max(list3));
	System.out.println("Max of list4: " + Collections.max(list4));

	// Search for the element 99 in each of the four lists
	System.out.println("Element 99 is in position " + search(list1, 99) + " in list1.");
	System.out.println("Element 99 is in position " + search(list2, 99) + " in list2.");
	System.out.println("Element 99 is in position " + search(list3, 99) + " in list3.");
	System.out.println("Element 99 is in position " + search(list4, 99) + " in list4.");
    
    }
}
elc3@goldberg:~/Documents/214/code/09/java$ javac Max.java
elc3@goldberg:~/Documents/214/code/09/java$ java Max
99 88 77 66 55 
55 66 77 88 99 
55 77 99 88 66 
44 55 66 77 88 
Max of list1: 99
Max of list2: 99
Max of list3: 99
Max of list4: 88
Element 99 is in position 0 in list1.
Element 99 is in position 4 in list2.
Element 99 is in position 2 in list3.
Element 99 is in position -1 in list4.
elc3@goldberg:~/Documents/214/code/09/java$ exit

Script done on Tue 19 Apr 2016 08:26:22 PM EDT
