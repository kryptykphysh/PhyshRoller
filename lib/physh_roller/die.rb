module PhyshRoller
	class Die
		attr_reader :sides_on_die, :last_result

		def initialize(sides_on_die)
			@sides_on_die = sides_on_die.to_i
			@last_result = 0
		end

		def roll
			@last_result = rand(1..@sides_on_die)
		end
	end
end