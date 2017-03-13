Script started on Thu 14 Apr 2016 07:12:36 PM EDT
elc3@leibniz:~/Documents/214/code/projects/project8/Ada$ cat temp_package.adb
-- temp_package.adb defines operations for the Temperature type.
--
-- Created by: Ethan Clark CS214 Project8
-- Date: April 13, 2016
----------------------------------------------------------------

with Ada.Text_IO, Ada.Float_Text_IO;
use Ada.Text_IO, Ada.Float_Text_IO;

package body temp_package is

	-- Declare variables to be used later in some of the functions
	new_temp1, new_temp2 : Temperature;
	user_input : float;
	user_scale : character;

	----------------------------------------------
  	-- Init initializes a Temperature variable          
  	-- Receive: Temp, the Temperature variable;          
  	--          Degrees, the degrees;         
  	--          Scale, the degree scale;        
  	-- Return: Temp, its myDegrees and myScale
	--	    set to Degrees and Scale
	----------------------------------------------
	procedure Init(Temp: out Temperature; Degrees: in float; Scale: in character) is
	begin
		if isValid(Degrees, Scale) then
			Temp.myDegrees := Degrees;
			Temp.myScale := Scale;
		end if;
	end Init;

 	----------------------------------------------
  	-- getDegrees(Temp) retrieves Temp.myDegrees        
  	-- Receive: Temp, a Temperature.                      
  	-- PRE: Temp has been initialized.            
  	-- Return: Temp.myDegrees.                     
  	----------------------------------------------
	function getDegrees(Temp: in Temperature) return float is
	begin
		return Temp.myDegrees;
	end getDegrees;

	----------------------------------------------
  	-- getScale(Temp) retrieves Temp.myScale        
  	-- Receive: Temp, a Temperature.                      
  	-- PRE: Temp has been initialized.            
  	-- Return: Temp.myScale.                     
  	----------------------------------------------
	function getScale(Temp: in Temperature) return character is
	begin
		return Temp.myScale;
	end getScale;

	----------------------------------------------------------------------------
	-- setFahrenheit(Temp) sets the current temperature to be in Fahrenheit
	-- Receive: Temp, a Temperature
	-- PRE: Temp has been initialized.
	-- Output: Temp.myDegrees is now in Fahrenheit
	----------------------------------------------------------------------------
	procedure setFahrenheit(Temp: out Temperature) is
	begin
		if Temp.myScale = 'C' or Temp.myScale = 'c' then
			Temp.myDegrees := (( Temp.myDegrees * (9.0/5.0)) + 32.0 );
			Temp.myScale := 'F';
		elsif ( Temp.myScale = 'K' or Temp.myScale = 'k' ) then
			Temp.myDegrees := (( Temp.myDegrees * (9.0/5.0)) - 459.67) ;
			Temp.myScale := 'F';
		end if;
	end setFahrenheit;
	
	-----------------------------------------------------------------------
	-- setCelsius(Temp) sets the current temperature to be in Celsius
	-- Receive: Temp, a Temperature
	-- PRE: Temp has been initialized.
	-- Output: Temp.myDegrees is now in Celsius
	-----------------------------------------------------------------------
	procedure setCelsius(Temp: out Temperature) is
	begin
		if Temp.myScale = 'F' or Temp.myScale = 'f' then
			Temp.myDegrees := (( Temp.myDegrees - 32.0) * (5.0/9.0) );
			Temp.myScale := 'C';
		elsif ( Temp.myScale = 'K' or Temp.myScale = 'k' ) then
			Temp.myDegrees := ( Temp.myDegrees - 273.15 );
			Temp.myScale := 'C';
		end if;
	end SetCelsius;

	---------------------------------------------------------------------
	-- setKelvin(Temp) sets the current temperature to be in Kelvin
	-- Receive: Temp, a Temperature
	-- PRE: Temp has been initialized.
	-- Output: Temp.myDegrees is now in Kelvin
	---------------------------------------------------------------------
	procedure setKelvin(Temp: out Temperature) is
	begin
		if Temp.myScale = 'F' or Temp.myScale = 'f' then
			Temp.myDegrees := (( Temp.myDegrees + 459.67) * (5.0/9.0) );
			Temp.myScale := 'K';
		elsif ( Temp.myScale = 'C' or Temp.myScale = 'c' ) then
			Temp.myDegrees := ( Temp.myDegrees + 273.15 );
			Temp.myScale := 'K';
		end if;
	end setKelvin;

	---------------------------------------------------------------------
	-- raise_temp(Temp, Degrees) raises the current degrees by Degrees
	-- Receive: Temp, a Temperature; Degreess, a float
	-- PRE: Temp has been initialized and Degrees is the same scale
	--	as the current myDegrees
	-- Output: Temp.myDegrees raised by Degrees
	---------------------------------------------------------------------
	procedure raise_temp(Temp: out Temperature; Degrees: in float) is
	begin
		Temp.myDegrees := Temp.myDegrees + Degrees;
	end raise_temp;

	---------------------------------------------------------------------
	-- lower(Temp, Degrees) lowers the current degrees by Degrees
	-- Receive: Temp, a Temperature; Degreess, a float
	-- PRE: Temp has been initialized and Degrees is the same scale
	--	as the current myDegrees
	-- Output: Temp.myDegrees lowered by Degrees
	---------------------------------------------------------------------
	procedure lower(Temp: out Temperature; Degrees: in float) is
	begin
		if isValid(Temp.myDegrees - Degrees, Temp.myScale) then
			Temp.myDegrees := Temp.myDegrees - Degrees;
		else
			Put("New temperature would be invalid!");
		end if;
		
	end lower;

	------------------------------------------------------------------
	-- equals(Temp1, Temp2) checks if the two Temperatures are equal
	-- Receive: Temp1 and Temp2, both Temperatures
	-- PRE: Temp1 and Temp2 have already been initialized
	-- Return: true if they are equal; false if they are not
	------------------------------------------------------------------
	function equals(Temp1: in Temperature; Temp2: in Temperature) return boolean is
	begin
		Init(new_temp1, getDegrees(Temp1), getScale(Temp1));
		Init(new_temp2, getDegrees(Temp2), getScale(Temp2));

		setFahrenheit(new_temp1);
		setFahrenheit(new_temp2);

		if new_temp1.myDegrees = new_temp2.myDegrees then
			return true;
		else
			return false;
		end if;

	end equals;

	------------------------------------------------------------------
	-- less_than(Temp1, Temp2) checks if Temp1 is less than Temp2
	-- Receive: Temp1 and Temp2, both Temperatures
	-- PRE: Temp1 and Temp2 have already been initialized
	-- Return: true if Temp1 < Temp2; otherwise return false
	------------------------------------------------------------------
	function less_than(Temp1: in Temperature; Temp2: in Temperature) return boolean is
	begin
		Init(new_temp1, getDegrees(Temp1), getScale(Temp1));
		Init(new_temp2, getDegrees(Temp2), getScale(Temp2));

		setFahrenheit(new_temp1);
		setFahrenheit(new_temp2);

		if new_temp1.myDegrees < new_temp2.myDegrees then
			return true;
		else
			return false;
		end if;

	end less_than;

	---------------------------------------------------------------------
	-- readTemp(Temp) reads in the temperature and scale from the user
	-- Receive: Temp, a Temperature
	-- PRE: Temp has already been initialized
	-- Output: Temp has new myDegrees and myScale values
	---------------------------------------------------------------------
	procedure readTemp(Temp: out Temperature) is
	begin
		New_Line;
		Put("Please enter the temperature: ");
		Get(user_input);
		Put("Please enter the scale: ");
		Get(user_scale);

		if isValid(user_input, user_scale) then
			Temp.myDegrees := user_input;
			Temp.myScale := user_scale;
		else
			Put("Invalid temperature!");
		end if;
	end readTemp;

	---------------------------------------------------------------------
	-- write(Temp) writes out the temperature and scale in a nice format
	-- Receive: Temp, a Temperature
	-- PRE: Temp has already been initialized
	-- Output: myDegrees and myScale in a nice format to the user
	---------------------------------------------------------------------
	procedure writeTemp(Temp: in Temperature) is
	begin
		Put(Temp.myDegrees);
		Put(" ");
		Put(Temp.myScale);
	end writeTemp;

	----------------------------------------------------------------------------------
	-- isValid(Degree, Scale) determines if the inputs are valid for a Temperature
	-- Receive: Degree, a float; Scale, a character
	-- Return: true if it is valid, false it if is not
	----------------------------------------------------------------------------------
	function isValid(Degree: in float; Scale: in character) return boolean is
	begin
		if Scale = 'K' or Scale = 'k' then
			if Degree < 0.0 then
				return false;
			else
				return true;
			end if;
		elsif Scale = 'C' or Scale = 'c' then
			if Degree < -237.0 then
				return false;
			else
				return true;
			end if;
		elsif Scale = 'F' or Scale = 'f' then
			if Degree < -459.0 then
				return false;
			else
				return true;
			end if;
		else
			Put("Invalid temperature");
			return false;
		end if;
	end isValid;

end temp_package;
elc3@leibniz:~/Documents/214/code/projects/project8/Ada$ cat T temp_package.ads
-- temp_package.ads declares the Temperature type and its operations.
--
-- Created by: Ethan Clark CS214 Project8
-- Date: April 13, 2016
---------------------------------------------------------------------

package temp_package is

	-- Declare the Temperature type to be private
	type Temperature is private;

	-- Declare all the Temperature methods to be used in the body of temp_package
	procedure Init(Temp: out Temperature; Degrees: in float; Scale: in character);

	function getDegrees(Temp: in Temperature) return float;

	function getScale(Temp: in Temperature) return character;

	procedure setFahrenheit(Temp: out Temperature);	

	procedure setCelsius(Temp: out Temperature);

	procedure setKelvin(Temp: out Temperature);

	procedure raise_temp(Temp: out Temperature; Degrees: in float);

	procedure lower(Temp: out Temperature; Degrees: in float);

	function equals(Temp1: in Temperature; Temp2: in Temperature) return boolean;

	function less_than(Temp1: in Temperature; Temp2: in Temperature) return boolean;

	procedure readTemp(Temp: out Temperature);

	procedure writeTemp(Temp: in Temperature);

	function isValid(Degree: in float; Scale: in character) return boolean;

	-- Declare private section of temp_package
	private

		-- Create the Temperature record with the two instance variables
		type Temperature is record
			myDegrees : float;
			myScale : character;
		end record;

end temp_package;
elc3@leibniz:~/Documents/214/code/projects/project8/Ada$ cat temperature.adb
-- temperature.adb "test-drives" the Temperature type.
--
-- Created by: Ethan Clark for CS214 Project8
-- Date: April 13, 2016
------------------------------------------------------

with Ada.Text_IO, Ada.Float_Text_IO, temp_package;
use Ada.Text_IO, Ada.Float_Text_IO, temp_package;

procedure temperature is

	-- Declaring variables to be used later in the table test procedure
	start_Temp, end_temp : temp_package.Temperature;
	increment_val : float;
	temp_scale : character;

begin
	-- Prompt the user for the starting temperature
	Put("Starting Temperature");
	readTemp(start_Temp);

	-- Prompt the user for the ending temperature
	Put("Ending Temperature");
	readTemp(end_temp);

	-- Prompt the user for the increment value
	Put("Please enter the increment value: ");
	Get(increment_val);

	temp_scale := getScale(start_temp);

	-- While loop to print out the temperature values in a table format in each scale
	while ( less_than(start_temp, end_temp) or equals(start_temp, end_temp) ) loop

		-- First print out the Fahrenheit degrees
		setFahrenheit(start_temp);
		writeTemp(start_temp);
		Put("     ");

		-- Second print out the Celsius degrees
		setCelsius(start_temp);
		writeTemp(start_temp);
		Put("     ");
		
		-- Third print out the Celsius degrees
		setKelvin(start_temp);
		writeTemp(start_temp);
		New_Line;

		-- Determine what the start_temp Scale was to return it back to that Scale
		if ( temp_scale = 'F' or temp_scale = 'f' ) then
			setFahrenheit(start_temp);
		elsif ( temp_scale = 'K' or temp_scale = 'k' ) then
			setKelvin(start_temp);
		elsif ( temp_scale = 'C' or temp_scale = 'c' ) then
			setCelsius(start_temp);
		end if;
	
		-- Increment the start_temp by increment_val
		raise_temp(start_temp, increment_val);

	end loop;

end temperature;
elc3@leibniz:~/Documents/214/code/projects/project8/Ada$ gnatmake temperature.adb
gcc-4.8 -c temperature.adb
gcc-4.8 -c temp_package.adb
temp_package.adb:63:20: warning: "Temp.myScale" may be referenced before it has a value
temp_package.adb:80:20: warning: "Temp.myScale" may be referenced before it has a value
temp_package.adb:97:20: warning: "Temp.myScale" may be referenced before it has a value
temp_package.adb:115:35: warning: "Temp.myDegrees" may be referenced before it has a value
temp_package.adb:127:28: warning: "Temp.myDegrees" may be referenced before it has a value
gnatbind -x temperature.ali
gnatlink temperature.ali
elc3@leibniz:~/Documents/214/code/projects/project8/Ada$ ./temperature
Starting Temperature
Please enter the temperature: 0
Please enter the scale: F
Ending Temperature
Please enter the temperature: 100
Please enter the scale: C
Please enter the increment value: 2.5
 0.00000E+00 F     -1.77778E+01 C      2.55372E+02 K
 2.49997E+00 F     -1.63889E+01 C      2.56761E+02 K
 4.99991E+00 F     -1.50001E+01 C      2.58150E+02 K
 7.49985E+00 F     -1.36112E+01 C      2.59539E+02 K
 9.99979E+00 F     -1.22223E+01 C      2.60928E+02 K
 1.24997E+01 F     -1.08335E+01 C      2.62316E+02 K
 1.49997E+01 F     -9.44463E+00 C      2.63705E+02 K
 1.74996E+01 F     -8.05578E+00 C      2.65094E+02 K
 1.99995E+01 F     -6.66692E+00 C      2.66483E+02 K
 2.24995E+01 F     -5.27807E+00 C      2.67872E+02 K
 2.49994E+01 F     -3.88921E+00 C      2.69261E+02 K
 2.74994E+01 F     -2.50036E+00 C      2.70650E+02 K
 2.99993E+01 F     -1.11150E+00 C      2.72038E+02 K
 3.24992E+01 F      2.77354E-01 C      2.73427E+02 K
 3.49992E+01 F      1.66621E+00 C      2.74816E+02 K
 3.74991E+01 F      3.05506E+00 C      2.76205E+02 K
 3.99991E+01 F      4.44392E+00 C      2.77594E+02 K
 4.24990E+01 F      5.83277E+00 C      2.78983E+02 K
 4.49989E+01 F      7.22163E+00 C      2.80372E+02 K
 4.74989E+01 F      8.61048E+00 C      2.81760E+02 K
 4.99988E+01 F      9.99934E+00 C      2.83149E+02 K
 5.24987E+01 F      1.13882E+01 C      2.84538E+02 K
 5.49987E+01 F      1.27770E+01 C      2.85927E+02 K
 5.74986E+01 F      1.41659E+01 C      2.87316E+02 K
 5.99986E+01 F      1.55548E+01 C      2.88705E+02 K
 6.24985E+01 F      1.69436E+01 C      2.90094E+02 K
 6.49984E+01 F      1.83325E+01 C      2.91482E+02 K
 6.74984E+01 F      1.97213E+01 C      2.92871E+02 K
 6.99983E+01 F      2.11102E+01 C      2.94260E+02 K
 7.24983E+01 F      2.24990E+01 C      2.95649E+02 K
 7.49982E+01 F      2.38879E+01 C      2.97038E+02 K
 7.74981E+01 F      2.52767E+01 C      2.98427E+02 K
 7.99981E+01 F      2.66656E+01 C      2.99816E+02 K
 8.24980E+01 F      2.80545E+01 C      3.01204E+02 K
 8.49980E+01 F      2.94433E+01 C      3.02593E+02 K
 8.74979E+01 F      3.08322E+01 C      3.03982E+02 K
 8.99978E+01 F      3.22210E+01 C      3.05371E+02 K
 9.24978E+01 F      3.36099E+01 C      3.06760E+02 K
 9.49977E+01 F      3.49987E+01 C      3.08149E+02 K
 9.74977E+01 F      3.63876E+01 C      3.09538E+02 K
 9.99976E+01 F      3.77764E+01 C      3.10926E+02 K
 1.02498E+02 F      3.91653E+01 C      3.12315E+02 K
 1.04997E+02 F      4.05541E+01 C      3.13704E+02 K
 1.07497E+02 F      4.19430E+01 C      3.15093E+02 K
 1.09997E+02 F      4.33319E+01 C      3.16482E+02 K
 1.12497E+02 F      4.47207E+01 C      3.17871E+02 K
 1.14997E+02 F      4.61096E+01 C      3.19260E+02 K
 1.17497E+02 F      4.74984E+01 C      3.20648E+02 K
 1.19997E+02 F      4.88873E+01 C      3.22037E+02 K
 1.22497E+02 F      5.02761E+01 C      3.23426E+02 K
 1.24997E+02 F      5.16650E+01 C      3.24815E+02 K
 1.27497E+02 F      5.30538E+01 C      3.26204E+02 K
 1.29997E+02 F      5.44427E+01 C      3.27593E+02 K
 1.32497E+02 F      5.58316E+01 C      3.28982E+02 K
 1.34997E+02 F      5.72204E+01 C      3.30370E+02 K
 1.37497E+02 F      5.86093E+01 C      3.31759E+02 K
 1.39997E+02 F      5.99981E+01 C      3.33148E+02 K
 1.42497E+02 F      6.13870E+01 C      3.34537E+02 K
 1.44996E+02 F      6.27758E+01 C      3.35926E+02 K
 1.47496E+02 F      6.41647E+01 C      3.37315E+02 K
 1.49996E+02 F      6.55536E+01 C      3.38704E+02 K
 1.52496E+02 F      6.69424E+01 C      3.40092E+02 K
 1.54996E+02 F      6.83313E+01 C      3.41481E+02 K
 1.57496E+02 F      6.97201E+01 C      3.42870E+02 K
 1.59996E+02 F      7.11090E+01 C      3.44259E+02 K
 1.62496E+02 F      7.24978E+01 C      3.45648E+02 K
 1.64996E+02 F      7.38867E+01 C      3.47037E+02 K
 1.67496E+02 F      7.52756E+01 C      3.48426E+02 K
 1.69996E+02 F      7.66644E+01 C      3.49814E+02 K
 1.72496E+02 F      7.80533E+01 C      3.51203E+02 K
 1.74996E+02 F      7.94421E+01 C      3.52592E+02 K
 1.77496E+02 F      8.08310E+01 C      3.53981E+02 K
 1.79996E+02 F      8.22198E+01 C      3.55370E+02 K
 1.82496E+02 F      8.36087E+01 C      3.56759E+02 K
 1.84996E+02 F      8.49975E+01 C      3.58148E+02 K
 1.87496E+02 F      8.63864E+01 C      3.59536E+02 K
 1.89995E+02 F      8.77753E+01 C      3.60925E+02 K
 1.92495E+02 F      8.91641E+01 C      3.62314E+02 K
 1.94995E+02 F      9.05530E+01 C      3.63703E+02 K
 1.97495E+02 F      9.19418E+01 C      3.65092E+02 K
 1.99995E+02 F      9.33307E+01 C      3.66481E+02 K
 2.02495E+02 F      9.47195E+01 C      3.67870E+02 K
 2.04995E+02 F      9.61084E+01 C      3.69258E+02 K
 2.07495E+02 F      9.74972E+01 C      3.70647E+02 K
 2.09995E+02 F      9.88861E+01 C      3.72036E+02 K
elc3@leibniz:~/Documents/214/code/projects/project8/Ada$ exit

Script done on Thu 14 Apr 2016 07:14:13 PM EDT
