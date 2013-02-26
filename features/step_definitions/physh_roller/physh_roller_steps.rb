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