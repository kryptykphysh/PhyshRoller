Feature: Parse String To Dice Roll

	As a user
	To create a dice roll
	I want to parse a string in to its components

	Scenario Outline: parse valid dice roll string
		Given I want to roll some dice
		When I create a new dice roll with the string "<string>"
		Then the number of dice should be "<number_of_dice>"
		And the sides on the dice should be "<sides_on_dice>"
		And the roll modifier should be "<roll_modifier>"

		Scenarios: different dice strings
		| string | number_of_dice | sides_on_dice | roll_modifier |
		| 1d6    | 1              | 6             | 0             |
		| 3d4    | 3              | 4             | 0             |
		| 1d6+1  | 1              | 6             | 1             |
		| 3d4-2  | 3              | 4             | -2            |