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
