/* TestRunner.java implements and tests class Temperature.
 * Created by: Ethan Clark
 * Date: April 12, 2016
 ************************************************************/
import org.junit.runner.Result;
import org.junit.runner.JUnitCore;
import org.junit.runner.notification.Failure;
import java.util.Scanner;

public class TestRunner{

	/***********************************************************
	* main function writes out a table of Fahrenheit, Celsius  *
	* 	and Kelvin degrees from user input                 *
	***********************************************************/
    	public static void main(String[] args) {

		Scanner keyboard = new Scanner(System.in);

		// Prompt the user for the starting temperature
		System.out.println("Starting Temperature");
		Temperature start_temp = new Temperature(30.0, 'F');
		start_temp.readTemp(keyboard);

		// Prompt the user for the ending temperature
		System.out.println("Limit Temperature");
		Temperature limit_temp = new Temperature(30.0, 'F');
		limit_temp.readTemp(keyboard);

		// Prompt the user for the increment value
		System.out.println("Please enter the increment value: ");
		double increment = keyboard.nextDouble();

		char starting_scale = start_temp.getScale();

		// While loop to print out the temperature values in a table format in each scale
		while ( start_temp.less_than(limit_temp) || start_temp.equals(limit_temp) )
		{
			// First print out the Fahrenheit degrees
			start_temp.setDegreesFahrenheit();
			start_temp.writeTemp();
			System.out.print("\t");
			
			// Second print out the Celsius degrees
			start_temp.setDegreesCelsius();
			start_temp.writeTemp();
			System.out.print("\t");
		
			// Third print out the Kelvin degrees
			start_temp.setDegreesKelvin();
			start_temp.writeTemp();
			System.out.print("\n");

			// Determine what the start_temp Scale was to return it back to that Scale
			if ( starting_scale == 'F' || starting_scale == 'f' )
			{
				start_temp.setDegreesFahrenheit();
			}

			if ( starting_scale == 'C' || starting_scale == 'c' )
			{
				start_temp.setDegreesCelsius();
			}

			if ( starting_scale == 'K' || starting_scale == 'k' )
			{
				start_temp.setDegreesKelvin();
			}

			// Increment the start_temp
			start_temp.raise(increment);
		}
	}

}
