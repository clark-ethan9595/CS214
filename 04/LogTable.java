/* LogTable.java displays a table of logarithms.
 *
 * Input: start, stop and increment, three doubles.
 * PRE: start < stop && increment > 0.
 * Output: A table of logarithms from start to stop,
 *         with increment as the step value.
 * Begun by: Nelesen, for CS 214 at Calvin College.
 * Completed by: Ethan Clark
 * Date: February 27, 2016
 ********************************************************/
import java.util.Scanner; 		// Get input

class LogTable{

  public static void main(String[] args){
    Scanner keyboard = new Scanner(System.in);

    System.out.println("To display a table of logarithms,");
    System.out.println("enter the start, stop and increment values: ");

    double start, stop, increment;		// Create three double variables

    start = keyboard.nextDouble();		// Read in the start value
    stop = keyboard.nextDouble();		// Read in the stop value
    increment = keyboard.nextDouble();		// Read in the increment value

    // While loop to display the table of logarithms that the user wants to see
    while(start <= stop){
	System.out.println("The logarithm of " + start + " is " + Math.log10(start));
	start = start + increment;
    }
  }
}

