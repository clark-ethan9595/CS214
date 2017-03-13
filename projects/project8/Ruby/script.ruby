Script started on Thu 14 Apr 2016 08:26:09 PM EDT
elc3@leibniz:~/Documents/214/code/projects/project8/Ruby$ cat Temperature.rb
# Temperature.rb holds the infromation for the Class Temperature
#
# Completed by: Ethan Clark Project8
# Date: April 14, 2016
#################################################################

# Wraps the Class Temperature into this module
module Temperatures

# Class Temperature to model a Temperature with degrees and scale
class Temperature

	# Initializer to initialize the Temperature type
	def initialize(degree, scale)
		if ( isValid(degree, scale) ) then
			@degree = degree
			@scale = scale
		else
			print "Invalid Temperature"
		end
	end

	# Accessor methods for the Temperature type
	attr_reader :degree, :scale

	##########################################################################
	## setFahrenheit() converts the current degrees to be in Fahrenheit     ##
	## Receive: Nothing                                                     ##
	## Output: Updated degrees in Fahrenheit and scale changed to 'F'       ##
	##########################################################################
	def setFahrenheit()
		if ( @scale == 'K' or @scale == 'k' ) then
			@degree = ((@degree * (9.0/5.0)) - 459.67)
			@scale = 'F'
		elsif ( @scale == 'C' or @scale == 'c' ) then
			@degree = ((@degree * (9.0/5.0)) + 32.0)
			@scale = 'F'
		end
	end

	##########################################################################
	## setCelsius() converts the current degrees to be in Celsius           ##
	## Receive: Nothing                                                     ##
	## Output: Updated degrees in Celsius and scale changed to 'C'          ##
	##########################################################################
	def setCelsius()
		if ( @scale == 'K' or @scale == 'k' ) then
			@degree = (@degree - 273.15)
			@scale = 'C'
		elsif ( @scale == 'F' or @scale == 'f' ) then
			@degree = ((@degree - 32.0) * (5.0/9.0))
			@scale = 'C'
		end
	end

	##########################################################################
	## setKelvin() converts the current degrees to be in Kelvin             ##
	## Receive: Nothing                                                     ##
	## Output: Updated degrees in Kelvin and scale changed to 'K'           ##
	##########################################################################
	def setKelvin()
		if ( @scale == 'F' or @scale == 'f' ) then
			@degree = ((@degree + 459.67) * (5.0/9.0))
			@scale = 'K'
		elsif ( @scale == 'C' or @scale == 'c' ) then
			@degree = (@degree + 273.15)
			@scale = 'K'
		end
	end

	#############################################################
	## raise(degrees) increases the current degree by degrees  ##
	## Recieve: degrees, a float                               ##
	## Output: @degree is raised by degrees                    ##
	#############################################################
	def raise(degrees)
		@degree = @degree + degrees
	end

	#############################################################
	## lower(degrees) decreases the current degree by degrees  ##
	## Recieve: degrees, a float                               ##
	## Output: @degree is lowered by degrees                   ##
	#############################################################
	def lower(degrees)
		if ( isValid(@degree - degrees) ) then
			@degree = @degree - degrees
		else
			print "New temperature will be invalid"
		end
	end

	################################################################
	## equals(temp) determines if the two Temperatures are equal  ##
	## Receive: temp, a Temperature				      ##
	## PRE: temp has already been initialized		      ##
	## Output: true if temperatures are equal, otherwise false    ##
	################################################################
	def equals(temp)

		temp_scale = @scale

		temp.setFahrenheit
		setFahrenheit

		if ( @degree == temp.degree ) then
			if ( temp_scale == 'C' or temp_scale == 'c' ) then
				setCelsius
			elsif ( temp_scale == 'K' or temp_scale == 'k' ) then
				setKelvin
			end
			return true
		else
			return false
		end
	end

	###################################################################################################
	## less_than(temp) determines if the calling Temperature is less than the parameter Temperature  ##
	## Receive: temp, a Temperature		                                        		 ##
	## PRE: temp has already been initialized					                 ##
	## Output: true if calling Temperature is less than parameter Temperature, otherwise false       ##
	###################################################################################################
	def less_than(temp)

		temp_scale = @scale

		temp.setFahrenheit
		setFahrenheit

		if ( @degree < temp.degree ) then
			if ( temp_scale == 'C' or temp_scale == 'c' ) then
				setCelsius
			elsif ( temp_scale == 'K' or temp_scale == 'k' ) then
				setKelvin
			end
			return true
		else
			return false
		end
	end
	
	####################################################################
	## readTemp() reads in the degrees and scale from the user        ##
	## Receive: None                                                  ##
	## Output: @degree and @scale are set from the user's input       ##
	####################################################################
	def readTemp()

		print "Please enter the degrees and scale: "
		user_input = gets

		new_array = user_input.split(" ")

		degree_temp = new_array[0].to_f
		temp_string = new_array[1]

		array2 = temp_string.split()

		scale_temp = array2[0]

		if ( isValid(degree_temp, scale_temp) ) then
			@degree = degree_temp
			@scale = scale_temp
		else
			print "Invalid Temperature"
		end
	end
	
	##############################################################################
	## writeTemp() writes out the Temperature degree and scale in a nice format ##
	## Receive: NONE                                                            ##
	## Output: degree and scale outputted to the user                           ##
	##############################################################################
	def writeTemp()
		rounded_degree = @degree.round(3)
		print rounded_degree.to_s + " " + @scale.to_s
	end	
	
	###############################################################################################
	## isValid(degrees, scale) checks to see if the degrees and scale make a valid temperature   ##
	##		i.e. Cannot be less than absolute zero                                       ##
	## Receive: degrees, a float; scale, a character                                             ##
	## Return: true if valid; otherwise false                                                    ##
	###############################################################################################
	def isValid(degrees, scale)
		if ( scale == 'K' or scale == 'k' ) then
			if ( degrees < 0.0 ) then
				return false;
			else
				return true;
			end
		elsif ( scale == 'C' or scale == 'c' ) then
			if ( degrees < -237.0 ) then
				return false;
			else
				return true;
			end
		elsif ( scale == 'F' or scale == 'f' ) then
			if ( degrees < -459.0 ) then
				return false;
			else
				return true;
			end
		else
			return false;
		end
	end
end

end
elc3@leibniz:~/Documents/214/code/projects/project8/Ruby$ cat Te    temperature_test.rb
# temperature_test.rb tests class Temperature and its operations
#
# Created by: Ethan Clark Project8
# Date: April 14, 2016
###################################################################

require "./Temperature"

def testTemperature

	# Create two Temperature variables
	start_Temp = Temperatures::Temperature.new(100.0, 'F')
	end_Temp = Temperatures::Temperature.new(100.0, 'F')

	# Prompt user for Starting Temperature
	print "Starting Temperature\n"
	start_Temp.readTemp

	# Prompt user for Ending Temperature
	print "Ending Temperature\n"
	end_Temp.readTemp

	# Prompt user for increment value
	puts("Please enter increment value: ")
	increment_value = gets.to_f

	temp_scale = start_Temp.scale

	# While loop to print out the temperature values in a table for each scale
	while start_Temp.less_than(end_Temp) do
		
		# First print out the Fahrenheit degrees
		start_Temp.setFahrenheit
		start_Temp.writeTemp
		print("\t\t")

		# Second print out the Celsius degrees
		start_Temp.setCelsius
		start_Temp.writeTemp
		print("\t\t")

		# Third print out the Kelvin degrees
		start_Temp.setKelvin
		start_Temp.writeTemp

		puts("\n")

		# Determine the start_Temp scale to return it to its original format
		if ( temp_scale == 'F' or temp_scale == 'f' ) then
			start_Temp.setFahrenheit
		elsif ( temp_scale == 'K' or temp_scale == 'k' ) then
			start_Temp.setKelvin
		elsif ( temp_scale == 'C' or temp_scale == 'c' ) then
			start_Temp.setCelsius
		end

		# Increment the start_Temp
		start_Temp.raise(increment_value)

	end
		
end

testTemperature
elc3@leibniz:~/Documents/214/code/projects/project8/Ruby$ ruby temperture    ature_tex st.rb
Starting Temperature
Please enter the degrees and scale: 0.  F
Ending Temperature
Please enter the degrees and scale: 100 C
Please enter increment value: 
2.5
0.0 F		-17.778 C		255.372 K
2.5 F		-16.389 C		256.761 K
5.0 F		-15.0 C		258.15 K
7.5 F		-13.611 C		259.539 K
10.0 F		-12.222 C		260.928 K
12.5 F		-10.833 C		262.317 K
15.0 F		-9.444 C		263.706 K
17.5 F		-8.056 C		265.094 K
20.0 F		-6.667 C		266.483 K
22.5 F		-5.278 C		267.872 K
25.0 F		-3.889 C		269.261 K
27.5 F		-2.5 C		270.65 K
30.0 F		-1.111 C		272.039 K
32.5 F		0.278 C		273.428 K
35.0 F		1.667 C		274.817 K
37.5 F		3.056 C		276.206 K
40.0 F		4.444 C		277.594 K
42.5 F		5.833 C		278.983 K
45.0 F		7.222 C		280.372 K
47.5 F		8.611 C		281.761 K
50.0 F		10.0 C		283.15 K
52.5 F		11.389 C		284.539 K
55.0 F		12.778 C		285.928 K
57.5 F		14.167 C		287.317 K
60.0 F		15.556 C		288.706 K
62.5 F		16.944 C		290.094 K
65.0 F		18.333 C		291.483 K
67.5 F		19.722 C		292.872 K
70.0 F		21.111 C		294.261 K
72.5 F		22.5 C		295.65 K
75.0 F		23.889 C		297.039 K
77.5 F		25.278 C		298.428 K
80.0 F		26.667 C		299.817 K
82.5 F		28.056 C		301.206 K
85.0 F		29.444 C		302.594 K
87.5 F		30.833 C		303.983 K
90.0 F		32.222 C		305.372 K
92.5 F		33.611 C		306.761 K
95.0 F		35.0 C		308.15 K
97.5 F		36.389 C		309.539 K
100.0 F		37.778 C		310.928 K
102.5 F		39.167 C		312.317 K
105.0 F		40.556 C		313.706 K
107.5 F		41.944 C		315.094 K
110.0 F		43.333 C		316.483 K
112.5 F		44.722 C		317.872 K
115.0 F		46.111 C		319.261 K
117.5 F		47.5 C		320.65 K
120.0 F		48.889 C		322.039 K
122.5 F		50.278 C		323.428 K
125.0 F		51.667 C		324.817 K
127.5 F		53.056 C		326.206 K
130.0 F		54.444 C		327.594 K
132.5 F		55.833 C		328.983 K
135.0 F		57.222 C		330.372 K
137.5 F		58.611 C		331.761 K
140.0 F		60.0 C		333.15 K
142.5 F		61.389 C		334.539 K
145.0 F		62.778 C		335.928 K
147.5 F		64.167 C		337.317 K
150.0 F		65.556 C		338.706 K
152.5 F		66.944 C		340.094 K
155.0 F		68.333 C		341.483 K
157.5 F		69.722 C		342.872 K
160.0 F		71.111 C		344.261 K
162.5 F		72.5 C		345.65 K
165.0 F		73.889 C		347.039 K
167.5 F		75.278 C		348.428 K
170.0 F		76.667 C		349.817 K
172.5 F		78.056 C		351.206 K
175.0 F		79.444 C		352.594 K
177.5 F		80.833 C		353.983 K
180.0 F		82.222 C		355.372 K
182.5 F		83.611 C		356.761 K
185.0 F		85.0 C		358.15 K
187.5 F		86.389 C		359.539 K
190.0 F		87.778 C		360.928 K
192.5 F		89.167 C		362.317 K
195.0 F		90.556 C		363.706 K
197.5 F		91.944 C		365.094 K
200.0 F		93.333 C		366.483 K
202.5 F		94.722 C		367.872 K
205.0 F		96.111 C		369.261 K
207.5 F		97.5 C		370.65 K
210.0 F		98.889 C		372.039 K
elc3@leibniz:~/Documents/214/code/projects/project8/Ruby$ exit

Script done on Thu 14 Apr 2016 08:26:39 PM EDT
