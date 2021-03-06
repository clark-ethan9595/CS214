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
