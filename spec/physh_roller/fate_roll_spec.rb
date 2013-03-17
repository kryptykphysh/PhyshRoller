require 'spec_helper'

module PhyshRoller
  describe FateRoll do
    before(:each) { @output = double('output').as_null_object }

    describe "attributes and method tests" do
      subject { FateRoll.new }

      it { should respond_to(:results) }
      it { should respond_to(:roll_dice) }
      its(:dice_roll_string) { should == '4d3' }
    end

    describe "#results" do
      before(:each) do
        @fate_roll = FateRoll.new
        @fate_roll.roll_dice
      end

      subject { @fate_roll.results }

      it                    { should be_a_kind_of(Hash) }
      its([:dice_roll])     { should == "FATE Roll"}
      its([:dice_rolls])    { should have(4).dice }
      its([:roll_modifier]) { should == 0 }
      its([:sum])           { should match /\A[\+-][01234]\z/ }
    end

    describe "#convert_dice_to_fate" do
      before { @fate_roll = FateRoll.new.roll_dice }

      it "should have 4 dice in the array" do
        @fate_roll.convert_dice_to_fate.size.should == 4
      end
 
      it "should have elements with value '+', 'Nil', or '-'" do
        @fate_roll.convert_dice_to_fate.each { |n|
          ['+', 'Nil', '-'].include?(n).should be_true
        }
      end
    end

    describe "#get_fate_total" do
      before { @fate_roll = FateRoll.new.roll_dice }

      subject { @fate_roll.get_fate_total }

      it { should match /\A[\+-][01234]\z/ }
    end
  end
end