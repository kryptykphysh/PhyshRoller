require 'spec_helper'


module PhyshRoller
	describe DiceRoll do
		before(:each) { @output = double('output').as_null_object }

		describe "attributes and method tests" do
			context "with a valid dice_roll_string" do
				subject { DiceRoll.new("4d6-1", @output) }

				it { should respond_to(:dice_roll_string) }
				it { should respond_to(:number_of_dice) }
				it { should respond_to(:sides_on_dice) }
				it { should respond_to(:roll_modifier) }
				it { should respond_to(:dice_array) }
				it { should respond_to(:results) }
			end

			context "with an invalid dice_roll_string" do
				it "should raise an error" do
					expect { DiceRoll.new("this_is_not_a_valid_dice_roll_string", @output) }.to \
						raise_error(ArgumentError, 'Invalid dice roll string.')
				end
			end
		end

		describe "#new" do
			subject do
			  DiceRoll.new(passed_dice_roll_string, @output)
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
				subject { DiceRoll.new("12d20-10", @output) }

				its(:valid_dice_roll_string?)	{ should be_true }
			end

			context "with an invalid dice_roll_string" do
				it "should raise an error" do
					expect { DiceRoll.new("this_is_not_a_valid_dice_roll_string", @output) }.to \
						raise_error(ArgumentError, 'Invalid dice roll string.')
				end
			end
		end

		describe "#roll_dice" do
			context "passed '3D6-1' as the dice_roll_string" do
				before(:each) { @dice_roll = DiceRoll.new("3D6-1", @output) }
				after(:each)	{ @dice_roll.roll_dice }

				it "should roll each die in :dice_array" do
					@dice_roll.dice_array.each do |die|
						die.should_receive(:roll)
					end
				end
			end
		end

		describe "#add_dice_to_dice_array" do
			before(:each) { @dice_roll = DiceRoll.new("3d6-1", @output) }
			
			context "with number_of_dice == 1 and sides_on_dice == 6" do
				it "should add another die to the :dice-array" do
					expect { @dice_roll.add_dice_to_dice_array(1, 6) }.to \
						change { @dice_roll.dice_array.size }.by(1)
				end
			end

			context "with number_of_dice == 3 and sides_on_dice == 6" do
				it "should add another die to the :dice-array" do
					expect { @dice_roll.add_dice_to_dice_array(3, 6) }.to \
						change { @dice_roll.dice_array.size }.by(3)
				end
			end
		end

		describe "#results" do
			context "before rolling the dice '99d20-10'" do
				subject { DiceRoll.new("99d20-10", @output).results }

				it 											{ should be_a_kind_of(Hash) }
				its([:dice_roll]) 			{ should eq("99d20-10") }
				its([:dice_rolls]) 			{ should have(99).dice }
				its([:roll_modifier]) 	{ should == -10 }
				its([:sum]) 						{ should be == -10 }
			end

			context "after rolling the dice '100d20+42'" do
				before(:each) do
					@dice_roll = DiceRoll.new("100d20+42", @output)
					@dice_roll.roll_dice
				end

				subject { @dice_roll.results }

				it 											{ should be_a_kind_of(Hash) }
				its([:dice_roll]) 			{ should eq("100d20+42") }
				its([:dice_rolls]) 			{ should have(100).dice }
				its([:roll_modifier]) 	{ should == 42 }
				its([:sum]) 						{ should be >= 142 }
				its([:sum])							{ should be <= 2042 }
			end
		end
	end
end