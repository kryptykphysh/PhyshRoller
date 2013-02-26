Given /^I want to roll some dice$/ do
  
end

When /^I create a new dice roll with the string "(.*?)"$/ do |dice_roll_string|
  @dice_roll = PhyshRoller::DiceRoll.new(dice_roll_string)
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
  @die.last_result.should be <= upper_limit.to_i
end