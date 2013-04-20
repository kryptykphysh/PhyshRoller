require 'spec_helper'

module PhyshRoller
  describe Die do
    describe "attributes" do
      subject { Die.new(8) }

      it { should respond_to(:sides_on_die) }
      its(:sides_on_die) { should be_a_kind_of(::Integer) }
      it { should respond_to(:last_result) }
      its(:last_result) { should be_a_kind_of(::Integer) }
    end

    describe "#new" do
      context "with a 1000 sided die" do
        subject { Die.new(1000) }

        its(:sides_on_die) { should == 1000 }
        its(:last_result) { should == 0 }
      end
    end

    describe "#roll" do
      context "starting with a new die with 100 sides" do
        before(:all) { @die = Die.new(100) }
        it ":last_result is 0" do
          @die.last_result.should == 0
        end

        it "#roll changes the :last_result from the default of 0" do
          expect { @die.roll }.to change { @die.last_result }.by_at_least(1)
        end

        describe ":last_result" do
          subject { @die.last_result }

          it { should be > 0 }
          it { should be <= @die.sides_on_die }
          it { should be_a_kind_of(::Integer) }
        end
      end
    end
  end
end
