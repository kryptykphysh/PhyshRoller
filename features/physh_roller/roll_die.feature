Feature: Simple Die Roll

	As a user
	I want to roll a die
	To generate a random number between 1 and the number of sides on the die

	Scenario Outline: Roll a die
		Given I want to roll a die with "<sides_on_die>" sides
		When I roll the die
		Then the result should be between "1" and "<sides_on_die>"

		Scenarios: different sides on die
		| sides_on_die |
		| 2						 |
		| 6            |
		| 12           |
		| 100          |
		| 1000         |
		| 3            |