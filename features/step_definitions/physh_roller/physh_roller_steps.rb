class Output
	def messages
		@messages = []
	end

	def puts(message)
		messages << message
	end
end

def output
	@output ||= Output.new
end

Given /^I want to roll some dice$/ do
  
end

When /^I create a new dice roll with the string "(.*?)"$/ do |dice_roll_string|
  @dice_roll = PhyshRoller::DiceRoll.new(dice_roll_string, output)
end

Then /^the number of dice should be "(.*?)"$/ do |number_of_dice|
  @dice_roll.number_of_dice.should == number_of_dice.to_i
end

Then /^the sides on the dice should be "(.*?)"$/ do |sides_on_dice|
  @dice_roll.sides_on_dice.should == sides_on_dice.to_i
end

Then /^the roll modifier should be "(.*?)"$/ do |roll_modifier|
  @dice_roll.roll_modifier.should == roll_modifier.to_i
end

Given /^I want to roll a die with "(.*?)" sides$/ do |sides_on_die|
  @die = PhyshRoller::Die.new(sides_on_die)
end

When /^I roll the die$/ do
  @die.roll
end

Then /^the result should be between "(.*?)" and "(.*?)"$/ do |lower_limit, upper_limit|
  @die.last_result.should be >= lower_limit.to_i
  puts @die.last_result
  @die.last_result.should be <= upper_limit.to_i
end

Given /^I have a dice roll string described by "(.*?)"$/ do |dice_roll_string|
  @dice_roll = PhyshRoller::DiceRoll.new(dice_roll_string, output)
end

When /^I roll the set of dice$/ do
  @dice_roll.roll_dice
end

Then /^I should see "(.*?)"$/ do |message|
  @output.messages.should include message
end

Then /^the result should have "(.*?)"$/ do |number_of_dice|
  @dice_roll.results[:dice_rolls].size.should == number_of_dice.to_i
end

Then /^each die roll should be equal to or greater than "(.*?)"$/ do |lower_limit|
  @dice_roll.results[:dice_rolls].each { |roll| roll.should be >= lower_limit.to_i }
end

Then /^each die roll should be equal to or less than "(.*?)"$/ do |upper_limit|
  @dice_roll.results[:dice_rolls].each { |roll| roll.should be <= upper_limit.to_i }
end

Then /^the total should be equal to or greater than "(.*?)"$/ do |lowest_total|
  @dice_roll.results[:sum].should be >= lowest_total.to_i
end

Then /^the total should be equal to or less than "(.*?)"$/ do |highest_total|
  @dice_roll.results[:sum].should be <= highest_total.to_i
end
