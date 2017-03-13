-- GradeSwitch.adb computes the letter grade based on an integer average
--
-- Input: the average score
-- Precondition: the average score is a positive integer
-- Output: the corresponding letter grade
--
-- Created by: Ethan Clark for CS 214 at Calvin College
-- Date: February 19, 2016
------------------------------------------------------------------------

with Ada.Text_IO, Ada.Integer_Text_IO;
use Ada.Text_IO, Ada.Integer_Text_IO;

procedure grade_switch is
	
	score: integer;
	choice: integer;

	-- Function letter_Grade computes the letter grade based on an average score
	-- Parameter: score, an integer
	-- Precondition: score is a positive integer
	-- Returns: the corresponding letter grade
	function GradeSwitch(score: integer) return String is

	begin
		case score/10 is
			when 10 | 9 => return "A";	-- Return A for 90-100
			when 8 => return "B";		-- Return B for 80-89
			when 7 => return "C";		-- Return C for 70-79
			when 6 => return "D";		-- Return D for 60-69
			when others => return "F";	-- Return F for any lower score
		end case;
	
	end GradeSwitch;

begin
	-- Ask the user if they want to run the tests or enter their own score
	New_Line;
	Put("Would you like to enter your own score or run the tests?");
	New_Line;
	Put("Enter 1 for your own score or 2 for the tests: ");
	get(choice);
	New_Line;

	-- If the user wants to enter his own choice...
	if choice = 1 then
		Put("Enter your integer score: ");	-- Prompt for the score
		get(score);				-- Receive the score
		Put( GradeSwitch(score) );		-- Output the letter grade to the user
		New_Line;

	-- If the user wants to run the tests...
	elsif choice = 2 then
		Put("Testing the score of 100... ");
		Put( GradeSwitch(100) );
		New_Line;

		Put("Testing the score of 92... ");
		Put( GradeSwitch(92) );
		New_Line;

		Put("Testing the score of 88... ");
		Put( GradeSwitch(88) );
		New_Line;

		Put("Testing the score of 77... ");
		Put( GradeSwitch(77) );
		New_Line;

		Put("Testing the score of 66... ");
		Put( GradeSwitch(66) );
		New_Line;

		Put("Testing the score of 55... ");
		Put( GradeSwitch(55) );
		New_Line;

	-- Else any other option from the user is invalid and program terminates
	else
		Put("Invalid Option!");

	end if;

end grade_switch;
