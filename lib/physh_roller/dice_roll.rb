module PhyshRoller
	class DiceRoll
		DICE_ROLL_REGEXP = /\A(\d+)?d(\d+)([\+-]\d*)?\z/i

		attr_reader :dice_roll_string, :number_of_dice, :sides_on_dice, :roll_modifier
		
		def initialize(dice_roll_string, output)
			@dice_roll_string = dice_roll_string.downcase
			if valid_dice_roll_string?
				set_default_values
			else
				raise ArgumentError.new('Invalid dice roll string.')
			end
		end

		def valid_dice_roll_string?
			!!(@dice_roll_string =~ DICE_ROLL_REGEXP)
		end

		def set_default_values
			@number_of_dice, @sides_on_dice, @roll_modifier =
					DICE_ROLL_REGEXP.match(@dice_roll_string).captures.map { |capture| capture.to_i }
			@number_of_dice = 1 unless (@number_of_dice > 0)
			@roll_modifier ||= 0
		end
	end
end