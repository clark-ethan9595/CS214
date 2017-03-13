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
