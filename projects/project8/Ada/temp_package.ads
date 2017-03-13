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
