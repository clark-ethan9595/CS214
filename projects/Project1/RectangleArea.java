/* RectangleArea.java computes the area of a rectangle
 *
 * Input: The height and the width of a rectangle
 * Precondition: The height and the width are positive numbers
 * Output: The area of the rectangle
 *
 * Created by: Ethan Clark, CS 214, Calvin College
 * Date: February 4, 2016
 */

import java.util.Scanner;	// include class for Scanner

public class RectangleArea
{
	/* function rectangleArea() computes a rectangle's area
	 * Parameters: l and w, both doubles
	 * Precondition: both l and w are positive
	 * Returns: the area of the rectangle
	 */
	public static double rectangleArea(double l, double w) {
		return l * w;				// return an expression
	}

	// main program
	public static void main(String[] args)
	{
		// Prompt the user for the length and width of a rectangle
		System.out.println("To compute the area of a rectangle, first give its length: ");
		
		// Create a connection named keyboard to standard in
		Scanner keyboard = new Scanner(System.in);

		// Get the length from the user
		double length = keyboard.nextDouble();

		// Prompt the user for the width of the rectangle
		System.out.println("Now give the width of the rectangle: ");
	
		// Get the width from the user
		double width = keyboard.nextDouble();

		// Output the area of the rectangle
		System.out.println("The area is " + rectangleArea(length, width));
	}
}
