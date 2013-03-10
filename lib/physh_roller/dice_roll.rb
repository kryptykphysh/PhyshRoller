module PhyshRoller
	class DiceRoll
		# Splits a dice roll string in to the :number_of_dice,
		# :sides_on_dice and :roll_modifier capture groups.
		DICE_ROLL_REGEXP = /\A(\d+)?d(\d+)([\+-]\d*)?\z/i

		# The original dice roll string, downcased and validated.
		attr_reader :dice_roll_string

		attr_reader :sides_on_dice, :roll_modifier, :dice_array
		
		def initialize(dice_roll_string, output=$stdout)
			@output = output
			@dice_roll_string = dice_roll_string.downcase.gsub(' ', '')
			if valid_dice_roll_string?
				set_default_values
				add_dice_to_dice_array(@number_of_dice, @sides_on_dice)
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
			@dice_array = []
		end

		def roll_dice
			@dice_array.each { |die| die.roll }
			return self
		end

		def add_dice_to_dice_array(number_of_dice, sides_on_dice)
			number_of_dice.times do
				die = Die.new(sides_on_dice)
				@dice_array << die
			end
		end

		def number_of_dice
			@dice_array.size
		end

		def results
			results_hash = { 
				:dice_roll 			=> @dice_roll_string,
				:dice_rolls 		=> @dice_array.map { |die| die.last_result }.sort,
				:roll_modifier 	=> @roll_modifier,
				:sum						=> (@dice_array.map { |die| die.last_result }.reduce(:+) + @roll_modifier)
			}
		end

		def output_results
			results = self.results
			@output.puts "You rolled: #{results[:dice_roll]}"
			@output.puts "Dice rolls: #{results[:dice_rolls].join(',')}"
			@output.puts "Total: #{results[:sum]}"
		end
	end
end