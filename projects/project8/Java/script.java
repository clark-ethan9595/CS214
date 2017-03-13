Script started on Thu 14 Apr 2016 08:34:39 PM EDT
elc3@leibniz:~/Documents/214/code/projects/project8/Java$ cat Temperature.java
/* Temperature.java implements class Temperature.
 *
 * Completed by: Ethan Clark Project8
 * Date: April 12, 2016
 */

import java.util.Scanner;

class Temperature
{

	// Create the private instance variables for the class Temperature
	private double myDegrees;
	private char myScale;

	/*****************************************************************
	* Temperature constructs a temperature from a double and a char  *
	* Receive: Degrees, a double; scale, a character                 *
	* Output: Set Degrees to myDegrees and scale to myScale          *
	*****************************************************************/
	public Temperature(double Degrees, char scale)
	{
		if ( isValid(Degrees, scale) )
		{
			myDegrees = Degrees;
			myScale = scale;
		}
		else
		{
			System.out.println("Invalid temperature requirements");
		}
	}

	/****************************************************************
	* getDegrees() returns the current double myDegrees             *
	* Receive: nothing                                              *
	* Precondition: myDegrees has been set                          *
	* Return: double myDegrees                                      *
	****************************************************************/
	public double getDegrees()
	{
		return myDegrees;
	}

	/****************************************************************
	* getScale() returns the current char myScale                   *
	* Receive: nothing                                              *
	* Precondition: myScale has been set                            *
	* Return: char myScale                                          *
	****************************************************************/
	public char getScale()
	{
		return myScale;
	}

	/*********************************************************************************
	* setDegreesFahrenheit() returns the degrees from the Temperature in Fahrenheit  *
	* Receive: Temperature temp                                                      *
	* Precondition: temp has already been set/declared                               *
	* Return: myDegrees from temp in Fahrenheit                                      *
	*********************************************************************************/
	public void setDegreesFahrenheit()
	{
		if ( getScale() == 'K' || getScale() == 'k' )
		{
			myDegrees = ((getDegrees() * (9.0/5.0)) - 459.67);
			myScale = 'F';
		}
		else if ( getScale() == 'C' || getScale() == 'c' )
		{
			myDegrees = ((getDegrees() * (9.0/5.0)) + 32.0);
			myScale = 'F';
		}
	}

	/*********************************************************************************
	* setDegreesCelsius() sets myDegrees to be Celsius                               *
	* Receive: None                                                                  *
	* Output: myDegrees is now in Celsius                                            *
	*********************************************************************************/
	public void setDegreesCelsius()
	{
		if ( getScale() == 'K' || getScale() == 'k' )
		{
			myDegrees = (getDegrees() - 273.15);
			myScale = 'C';
		}
		else if ( getScale() == 'F' || getScale() == 'f' )
		{
			myDegrees = ((getDegrees() - 32.0) * (5.0/9.0));
			myScale = 'C';
		}
	}

	/*********************************************************************************
	* setDegreesKelvin() returns the degrees from the Temperature in Kelvin          *
	* Receive: None                                                                  *
	* Output: myDegrees is now in Kelvin                                             *
	*********************************************************************************/
	public void setDegreesKelvin()
	{
		if ( getScale() == 'F' || getScale() == 'f' )
		{
			myDegrees = ((getDegrees() + 459.67) * (5.0/9.0));
			myScale = 'K';
		}
		else if ( getScale() == 'C' || getScale() == 'c' )
		{
			myDegrees = (getDegrees() + 273.15);
			myScale = 'K';
		}
	}

	/*********************************************************************************
	* raise() updates the myDegrees to be raised by Degrees                          *
	* Receive: double Degrees                                                        *
	* Output: myDegrees is myDegrees plus Degrees                                    *
	*********************************************************************************/
	public void raise(double Degrees)
	{
		myDegrees = myDegrees + Degrees;
	}
	
	/**********************************************************************************
	* lower() updates the myDegrees to be lowered by Degrees                          *
	* Receive: double Degrees                                                         *
	* Output: myDegrees is myDegrees minus Degrees                                    *
	**********************************************************************************/
	public void lower(double Degrees)
	{
		if ( isValid(myDegrees - Degrees, myScale) )
			myDegrees = myDegrees - Degrees;
		else
			System.out.println("New temperature is invalid!");
	}

	/*************************************************************************
	* equals() checks if the two temperatures are equal                      *
	* Receive: Temperature temp                                              *
	* Return: boolean true or false                                          *
	*************************************************************************/
	public boolean equals(Temperature temp)
	{
		char temp_scale = getScale();

		temp.setDegreesFahrenheit();
		setDegreesFahrenheit();

		if ( temp.getDegrees() == getDegrees() )
		{
			if ( temp_scale == 'C' || temp_scale == 'c' )
				setDegreesCelsius();
			else if ( temp_scale == 'K' || temp_scale == 'k' )
				setDegreesKelvin();
			return true;
		} else
			return false;
	}

	/*************************************************************************
	* less_than() checks if the two temperatures are equal                   *
	* Receive: Temperature temp                                              *
	* Return: boolean true or false                                          *
	*************************************************************************/
	public boolean less_than(Temperature temp)
	{
		char temp_scale = getScale();

		temp.setDegreesFahrenheit();
		setDegreesFahrenheit();

		if ( getDegrees() < temp.getDegrees() )
		{
			if ( temp_scale == 'C' || temp_scale == 'c' )
				setDegreesCelsius();
			else if ( temp_scale == 'K' || temp_scale == 'k' )
				setDegreesKelvin();
			return true;
		} else
			return false;
	}
	
	/****************************************************************
	* readTemp() reads in the degrees and scale from the user       *
	* Receive: Scanner keyboard for the input                       *
	* Output: myDegrees and myScale are set to what the user input  *
	****************************************************************/
	public void readTemp(Scanner keyboard)
	{
		System.out.println("Please enter the degrees and scale: ");
		String temp_and_scale = keyboard.nextLine();

		String[] theArray = temp_and_scale.split(" ");

		String theDegrees = theArray[0];
		double Degrees = Double.parseDouble(theDegrees);

		String current_scale = theArray[1];
		char Scale = current_scale.charAt(0);

		if ( isValid(Degrees, Scale) )
		{
			myDegrees = Degrees;
			myScale = Scale;
		}
		else {
			System.out.println("Invalid temperature");
		}
	}

	/*********************************************************************************
	* writeTemp() writes out the degrees and the scale in String format to the user  *
	* Receive: None                                                                  *
	* Return: String in the format degrees + scale                                   *
	*********************************************************************************/
	public void writeTemp()
	{
		double current = getDegrees();
		System.out.print(Double.toString(current) + " " + getScale());
	}

	/********************************************************************************************
	* isValid(Degrees, Scale) determines if the Degrees and Scale would be a valid Temperature  *
	*		i.e. Cannot be less than absolute zero                                      *
	* Receive: Degrees, a double; Scale, a char                                                 *
	* Return: true if it is valid; otherwise returns false                                      *
	********************************************************************************************/
	public boolean isValid(double Degrees, char Scale)
	{
		if ( Scale == 'K' || Scale == 'k' )
		{
			if ( Degrees < 0.0 )
				return false;
			else
				return true;
		}
		else if ( Scale == 'C' || Scale == 'c' )
		{
			if ( Degrees < -237.0 )
				return false;
			else
				return true;
		}
		else if ( Scale == 'F' || Scale == 'f' )
		{
			if ( Degrees < -459.0 )
				return false;
			else
				return true;
		}
		else
			return false;
	}
}
elc3@leibniz:~/Documents/214/code/projects/project8/Java$ cat TestRunner.java
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
elc3@leibniz:~/Documents/214/code/projects/project8/Java$ javac -cp /usr/share/java/junit4-4.11.jar:. TestRunner.java
elc3@leibniz:~/Documents/214/code/projects/project8/Java$ java -cp /usr/share/java/junit4-4.11.jar:. TestRunner
Starting Temperature
Please enter the degrees and scale: 
0 F
Limit Temperature
Please enter the degrees and scale: 
100 C
Please enter the increment value: 
2.5
0.0 F	-17.77777777777778 C	255.3722222222222 K
2.499999999999943 F	-16.38888888888892 C	256.76111111111106 K
4.999999999999886 F	-15.000000000000064 C	258.1499999999999 K
7.4999999999998295 F	-13.611111111111207 C	259.5388888888888 K
9.999999999999773 F	-12.22222222222235 C	260.92777777777764 K
12.499999999999716 F	-10.833333333333492 C	262.3166666666665 K
14.999999999999659 F	-9.444444444444635 C	263.70555555555535 K
17.499999999999602 F	-8.055555555555777 C	265.0944444444442 K
19.999999999999545 F	-6.666666666666919 C	266.48333333333306 K
22.49999999999949 F	-5.277777777778062 C	267.8722222222219 K
24.99999999999943 F	-3.888888888889205 C	269.2611111111108 K
27.499999999999375 F	-2.5000000000003473 C	270.64999999999964 K
29.999999999999318 F	-1.1111111111114902 C	272.0388888888885 K
32.49999999999926 F	0.27777777777736723 C	273.42777777777735 K
34.999999999999204 F	1.6666666666662246 C	274.8166666666662 K
37.49999999999915 F	3.055555555555082 C	276.20555555555507 K
39.99999999999909 F	4.444444444443939 C	277.5944444444439 K
42.499999999999034 F	5.833333333332797 C	278.9833333333328 K
44.99999999999898 F	7.222222222221654 C	280.37222222222164 K
47.49999999999892 F	8.611111111110512 C	281.7611111111105 K
49.99999999999886 F	9.99999999999937 C	283.14999999999935 K
52.499999999998806 F	11.388888888888227 C	284.5388888888882 K
54.999999999998806 F	12.777777777777116 C	285.92777777777707 K
57.49999999999869 F	14.166666666665941 C	287.3166666666659 K
59.99999999999869 F	15.55555555555483 C	288.7055555555548 K
62.49999999999858 F	16.944444444443654 C	290.09444444444364 K
64.99999999999858 F	18.333333333332543 C	291.4833333333325 K
67.49999999999847 F	19.72222222222137 C	292.87222222222135 K
69.99999999999847 F	21.111111111110258 C	294.2611111111102 K
72.49999999999835 F	22.499999999999087 C	295.64999999999907 K
74.99999999999835 F	23.888888888887973 C	297.0388888888879 K
77.49999999999824 F	25.2777777777768 C	298.4277777777768 K
79.99999999999824 F	26.666666666665687 C	299.81666666666564 K
82.49999999999812 F	28.055555555554516 C	301.2055555555545 K
84.99999999999812 F	29.444444444443402 C	302.59444444444335 K
87.49999999999801 F	30.83333333333223 C	303.9833333333322 K
89.99999999999801 F	32.22222222222112 C	305.3722222222211 K
92.49999999999801 F	33.611111111110006 C	306.76111111111 K
94.99999999999801 F	34.9999999999989 C	308.1499999999989 K
97.49999999999801 F	36.388888888887784 C	309.53888888888775 K
99.99999999999801 F	37.77777777777668 C	310.92777777777667 K
102.49999999999801 F	39.16666666666556 C	312.3166666666655 K
104.9999999999979 F	40.55555555555439 C	313.7055555555544 K
107.4999999999979 F	41.94444444444328 C	315.09444444444324 K
109.99999999999778 F	43.33333333333211 C	316.4833333333321 K
112.49999999999778 F	44.72222222222099 C	317.87222222222096 K
114.99999999999767 F	46.11111111110982 C	319.2611111111098 K
117.49999999999767 F	47.49999999999871 C	320.64999999999867 K
119.99999999999756 F	48.888888888887536 C	322.0388888888875 K
122.49999999999756 F	50.27777777777642 C	323.4277777777764 K
124.99999999999744 F	51.66666666666525 C	324.81666666666524 K
127.49999999999744 F	53.055555555554136 C	326.2055555555541 K
129.99999999999733 F	54.444444444442965 C	327.59444444444296 K
132.49999999999733 F	55.83333333333185 C	328.9833333333318 K
134.99999999999721 F	57.22222222222068 C	330.37222222222067 K
137.49999999999721 F	58.611111111109565 C	331.7611111111095 K
139.9999999999971 F	59.999999999998394 C	333.1499999999984 K
142.4999999999971 F	61.38888888888728 C	334.53888888888724 K
144.999999999997 F	62.77777777777611 C	335.9277777777761 K
147.499999999997 F	64.166666666665 C	337.31666666666496 K
149.99999999999687 F	65.55555555555382 C	338.7055555555538 K
152.49999999999687 F	66.94444444444271 C	340.0944444444427 K
154.99999999999676 F	68.33333333333154 C	341.48333333333153 K
157.49999999999676 F	69.72222222222042 C	342.8722222222204 K
159.99999999999665 F	71.11111111110925 C	344.26111111110924 K
162.49999999999665 F	72.49999999999814 C	345.6499999999981 K
164.99999999999653 F	73.88888888888697 C	347.03888888888696 K
167.49999999999653 F	75.27777777777585 C	348.4277777777758 K
169.99999999999642 F	76.66666666666468 C	349.8166666666647 K
172.49999999999642 F	78.05555555555357 C	351.20555555555353 K
174.9999999999963 F	79.4444444444424 C	352.5944444444424 K
177.4999999999963 F	80.83333333333128 C	353.98333333333125 K
179.9999999999962 F	82.22222222222011 C	355.3722222222201 K
182.4999999999962 F	83.611111111109 C	356.76111111110896 K
184.99999999999608 F	84.99999999999783 C	358.1499999999978 K
187.49999999999608 F	86.38888888888671 C	359.5388888888867 K
189.99999999999596 F	87.77777777777554 C	360.92777777777553 K
192.49999999999596 F	89.16666666666443 C	362.3166666666644 K
194.99999999999585 F	90.55555555555325 C	363.70555555555325 K
197.49999999999585 F	91.94444444444214 C	365.0944444444421 K
199.99999999999574 F	93.33333333333097 C	366.48333333333096 K
202.49999999999574 F	94.72222222221986 C	367.8722222222198 K
204.99999999999562 F	96.11111111110868 C	369.2611111111087 K
207.49999999999562 F	97.49999999999757 C	370.64999999999753 K
209.9999999999955 F	98.8888888888864 C	372.0388888888864 K
elc3@leibniz:~/Documents/214/code/projects/project8/Java$ exit

Script done on Thu 14 Apr 2016 08:35:32 PM EDT
