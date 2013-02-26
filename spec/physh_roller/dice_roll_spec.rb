require 'spec_helper'


module PhyshRoller
	describe DiceRoll do
		describe "attributes and method tests" do
			context "with a valid dice_roll_string" do
				subject { DiceRoll.new("4d6-1") }

				it { should respond_to(:dice_roll_string) }
				it { should respond_to(:number_of_dice) }
				it { should respond_to(:sides_on_dice) }
				it { should respond_to(:roll_modifier) }
			end

			context "with an invalid dice_roll_string" do
				expect { DiceRoll.new("this_is_not_a_valid_dice_roll_string") }.to raise_exception
			end
		end

		describe "#new" do
			subject do
			  DiceRoll.new(passed_dice_roll_string)
		  end

			context "passed '3d6-1' as dice roll string" do
				let(:passed_dice_roll_string) { "3d6-1" }
				its(:dice_roll_string)				{ should == "3d6-1" }
				its(:number_of_dice)					{ should == 3 }
				its(:sides_on_dice)						{ should == 6 }
				its(:roll_modifier)						{ should == -1 }
			end

			context "passed 'D4' as dice roll string" do
				let(:passed_dice_roll_string) { "D4" }
				its(:dice_roll_string)				{ should == "d4" }
				its(:number_of_dice)					{ should == 1 }
				its(:sides_on_dice)						{ should == 4 }
				its(:roll_modifier)						{ should == 0 }
			end
		end

		describe "#valid_dice_roll_string?" do
			context "with a valid dice_roll_string" do
				subject { DiceRoll.new("12d20-10") }

				its(:valid_dice_roll_string?)	{ should be_true }
			end

			context "with an invalid dice_roll_string" do
				expect { DiceRoll.new("this_is_not_a_valid_dice_roll_string") }.to raise_exception
			end
		end
	end
end