class Game
  attr_accessor :red_vp, :blue_vp

  def initialize
    @red_vp = 0
    @blue_vp = 0
  end

  # red_units, blue_units; array of Unit objects
  # attacker; string 'blue' or 'red'
  def combat_result(red_units, blue_units, attacker)
    red_strength = red_units.map(&:strength).reduce(:+)
    blue_strength = blue_units.map(&:strength).reduce(:+)
    # puts red_strength, blue_strength

    # ruby auto rounds down
    strength_ratio = nil
    if attacker == 'red'
      strength_ratio = red_strength/blue_strength
    else
      strength_ratio = blue_strength/red_strength
    end

    strength_ratio = 6 if strength_ratio > 6

    combat_roll = rand(0..5)

    puts "Strength Ratio: #{strength_ratio}\nCombat Roll: #{combat_roll + 1}"
    # strength ratio determines column, roll determines damage
    # this will need reiteration, but just trying to get a basic
    # system working
    combat_result_table = {
                            1 => [0, 0, 0, 1, 1, 2],
                            2 => [0, 0, 1, 2, 2, 2],
                            3 => [1, 2, 2, 3, 4, 5],
                            4 => [2, 3, 3, 3, 4, 5],
                            5 => [2, 3, 3, 4, 5, 6],
                            6 => [2, 3, 5, 5, 6, 6]
                          }

    combat_result_table[strength_ratio][combat_roll]
  end

  def winner
    if @red_vp == @blue_vp
      'Tie'
    elsif @red_vp > @blue_vp
      'Red'
    else
      'Blue'
    end
  end
end
