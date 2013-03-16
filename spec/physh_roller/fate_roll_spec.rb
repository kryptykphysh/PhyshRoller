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

    describe "#convert_dice_to_fate"

    describe "#get_fate_total"
  end
end