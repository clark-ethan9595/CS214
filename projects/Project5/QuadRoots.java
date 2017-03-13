/* QuadRoots.java is a program that computes the roots of a quadratic equation
 * 	and displays them to the user
 * 
 * Receive: three floats corresponding to the quadratic equation of
 *	ax^2 + bx + c
 * Precondition: Preconditions are checked in the quadraticRoots function
 * Return: returns the two roots of the equation, if there are any
 *	otherwise it reveals an error message for the user
 * 
 * Completed by: Ethan Clark for CS 214 Homework5
 * Date: March 4, 2016
 ****************************************************************************/

import java.util.Scanner;
import java.lang.Math;

//Java QuadRoots class
public class QuadRoots
{
	
	//main function
	public static void main(String[] args)
	{
		Scanner keyboard = new Scanner(System.in);
		
		//Prompt the user for three floats for the quadratic equation
		System.out.println("\nTo compute the roots of a quadratic equation...");
		System.out.println("\nin the form of y = ax^2 + bx + c.");

		//Receive the float for a
		System.out.println("\nEnter the number for a: ");
		double a_value = keyboard.nextDouble();

		//Receive the float for b
		System.out.println("\nEnter the number for b: ");
		double b_value = keyboard.nextDouble();

		//Receive the float for c
		System.out.println("\nEnter the number for c: ");
		double c_value = keyboard.nextDouble();

		//Create a new array to store the two root values
		double [] rootlist = new double[2];

		//Call the quadraticRoots function to determine what are the roots, if there are any
		boolean isRoots = quadraticRoots(a_value, b_value, c_value, rootlist);

		//If there are roots, output the two roots
		if (isRoots)
			System.out.println("The roots of your equation are " + rootlist[0] + " and " + rootlist[1]);
	}

	//Java function to compute the roots of a quadratic equation
	public static boolean quadraticRoots(double a, double b, double c, double[] rootlist)
	{
		//If the value of is not 0, causing an zero division error...
		if (a != 0) {

			//Compute the discriminant to be used multiple times
			double arg = Math.pow(b, 2.0) - 4.0 * a * c;

			//If arg is greater than or equal to zero...
			if (arg >= 0) {
				rootlist[0] = (-b + Math.sqrt(arg)) / (2.0 * a);
				rootlist[1] = (-b - Math.sqrt(arg)) / (2.0 * a);
				return true;
			}

			//Else if arg is less than zero...
			else {
				System.out.println("\n quadraticRoots(): b^2 - 4ac is negative!");
				return false;
			}
		}

		// Else if a equals zero...
		else {
			System.out.println("\n quadraticRoots(): a is zero!");
			return false;
		}
	}
}
