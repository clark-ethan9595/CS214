/* GradeSwitch.java computes the letter grade based on an integer average
 *
 * Input: the average score
 * Precondition: the score is an integer
 * Output: the corresponding letter grade
 *
 * Created by: Ethan Clark for CS 214 at Calvin College
 * Date: February 19, 2016
 *************************************************************************/

import java.util.Scanner;

public class GradeSwitch
{
	public static void main(String[] args) {
		Scanner keyboard = new Scanner(System.in);

		//Ask the user if they want to run the tests or enter their own score
		System.out.println("\nWould you like to enter your own score or run the test?");
		System.out.println("\nEnter 1 for entering own score and 2 for the tests: ");
		
		//Read in the user choice
		String choice = keyboard.next();

		//If the user chooses to enter own score...
		if (choice.equals("1")) { 
			System.out.println("\nEnter your integer score: ");	//Prompt for an integer score from user
		
			String word = keyboard.next();				//Read in the score as a string
			int score = Integer.parseInt(word);			//Convert the score to an int
			System.out.println(letterGrade(score));			//Print out the letter grade by calling letterGrade
		} 

		//Else if the user chooses to run the tests...		
		else if (choice.equals("2")) {
			System.out.println("\nTesting the score of 100...");
			System.out.println(" " + letterGrade(100));

			System.out.println("\nTesting the score of 95...");
			System.out.println(" " + letterGrade(95));

			System.out.println("\nTesting the score of 90...");
			System.out.println(" " + letterGrade(90));

			System.out.println("\nTesting the score of 89...");
			System.out.println(" " + letterGrade(89));

			System.out.println("\nTesting the score of 80...");
			System.out.println(" " + letterGrade(80));

			System.out.println("\nTesting the score of 76...");
			System.out.println(" " + letterGrade(76));

			System.out.println("\nTesting the score of 64...");
			System.out.println(" " + letterGrade(64));

			System.out.println("\nTesting the score of 40...");
			System.out.println(" " + letterGrade(40));
		}

		//Else anything the user enters is invalid
		else {
			System.out.println("\nInvalid option!");
		}
	}

	/* function letterGrade() computes the letter grade, given an integer score
	 * Parameter: score, an integer
	 * Precondition: score is a positive integer
	 * Returns: the corresponding letter grade
	 */
	public static String letterGrade(int score) {
		switch (score / 10)
		{
			//90-100 is an A
			case 10: case 9:
				return "A";

			//80-89 is a B
			case 8:
				return "B";

			//70-79 is a C
			case 7:
				return "C";

			//60-69 is a D
			case 6:
				return "D";

			//anything else is an F
			default:
				return "F";
		}
	}
}
