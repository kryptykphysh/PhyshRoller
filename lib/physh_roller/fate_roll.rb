module PhyshRoller
  class FateRoll < DiceRoll
    def initialize(dice_roll_string='4d3',output=$stdout)
      super
    end

    def results
      results_hash = {
        :dice_roll      => 'FATE Roll',
        :dice_rolls     => convert_dice_to_fate,
        :sum            => get_fate_total,
        :roll_modifier  => 0
      }
    end

    def convert_dice_to_fate
      dice_rolls = @dice_array.map { |die| die.last_result - 2 }.sort.reverse
      converted_dice = dice_rolls.map do |roll|
        case roll
        when -1
          then '-'
        when 0
          then 'Nil'
        when 1
          then '+'
        end
      end
      return converted_dice
    end

    def get_fate_total
      sum = @dice_array.map { |die| die.last_result - 2 }.reduce(:+)
      sum >= 0 ? '+' + sum.to_s : sum.to_s
    end
  end
end