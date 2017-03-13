/* Factorial.java computes the factorial of a user input integer
 *
 * Input: a positive integer, n
 * Precondition: a positive integer
 * Output: the factorial (!) of the integer
 *
 * Created by: Ethan Clark for CS 214 Homework4 at Calvin College
 * Date: February 29, 2016
 ********************************************************************/

import java.util.Scanner;

public class Factorial
{
	public static void main(String[] args) {
		Scanner keyboard = new Scanner(System.in);

		// Prompt the user to enter an integer
		System.out.println("\nCalculating factorial...");
		System.out.println("\nPlease enter an integer: ");

		// Read in the string, convert it to an int
		String word = keyboard.next();
		int number = Integer.parseInt(word);

		// Output the factorial to the user
		System.out.println("The factorial of " + number + " is " + factorial_calc(number));
	}

	/* function factorial_calc() computes the factorial, given the integer
	 * Parameter: int number
	 * Precondition: number is a positive integer
	 * Returns: the calculated factorial
	 */
	public static int factorial_calc(int number) {

		int answer = 1;				// Initialize the return answer to be 1

		for (int i = 2; i <= number; i++) {	// For loop to multiply every number from 2
			answer *= i;				// to number to the answer variable
		}

		return answer;				// Return answer
	}
}
