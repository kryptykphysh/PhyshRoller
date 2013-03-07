Feature: Roll dice

	As a user
	I want to roll a set of dice
	To get a set of rolls and a total

	Scenario Outline: getting the result of rolling some dice
		Given I have a dice roll string described by "<dice_roll_string>"
		When I roll the set of dice
		Then the result should have "<number_of_dice>"
		And each die roll should be equal to or greater than "<lower_limit>"
		And each die roll should be equal to or less than "<upper_limit>"
		And the total should be equal to or greater than "<lowest_total>"
		And the total should be equal to or less than "<upper_total>"


		Scenarios: different dice strings
		| dice_roll_string | lower_limit | upper_limit | lowest_total | upper_total | number_of_dice |
		| 1d6    					 | 1           | 6           | 1            | 6           | 1              |
		| 3d4              | 1           | 4           | 3            | 12          | 3              |
		| 1d6+1            | 1           | 6           | 2            | 7           | 1              |
		| 3d4-2            | 1           | 4           | 1            | 10          | 3              |