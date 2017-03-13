/* ArrayProcessing.java is a driver for printArray() and readArray()
 * Created by: Ethan Clark Project6
 * Date: 3/30/2016
 * Precondition: theArray, is an array of double values
 * Output: each value in the array
 ***************************************************************/

import java.util.Scanner;

public class ArrayProcessing
{
  public static void main(String[] args)
    {
	// Create a new Scanner for receiving and printing to the user
	Scanner keyboard = new Scanner(System.in);
	System.out.println("Enter the size of the array: ");
	
	// Read in the size of the array from the user
	int size = keyboard.nextInt();

	// Create an array the size that the user gave
	double[] theArray = new double[size];

	// Call readArray to fill the array, printArray to output the array
	readArray(theArray, size, keyboard);
	printArray(theArray, size, keyboard);
    }
  

  /* readArray() is a method that reads in user doubles for an array
   * Receive: theArray, an array of doubles; size, the size of the array
   * Output: theArray is filled with double values from the user
   ********************************************************************/
   public static void readArray(double[] theArray, int size, Scanner keyboard) {

	System.out.println("Please enter " + size + " values for the array: ");

	// Read in values to fill up theArray with doubles
	for (int i = 0; i < size; i++) {
		theArray[i] = keyboard.nextDouble();
	}
   }

  
  /* printArray() is a method that prints the values in an array
   * Receive: theArray, an array of doubles; size, the size of the array
   * Output: each value in the array is printed to the user
   *********************************************************************/
   public static void printArray(double[] theArray, int size, Scanner keyboard) {

	System.out.println("\nYour array contains the following values: ");

	// Print out each value in the array
	for (int i = 0; i < size; i++) {
		System.out.println(theArray[i]);
	}
   }
}
