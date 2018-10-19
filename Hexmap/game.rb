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

    combat_roll = rand(0..9)

    puts "Strength Ratio: #{strength_ratio}\nCombat Roll: #{combat_roll + 1}"

    # calculate column shift from strength ratio

    # strength ratio determines column, roll determines damage
    # combat result table (crt) taken from SPI version of Blue & Grey
    #                      atk/def  1-5   1-4   1-3   1-2   1-1   2-1   3-1   4-1   5-1   6-1
    combat_result_table = {
                            1  => ['ar', 'ar', 'dr', 'dr', 'dr', 'dr', 'de', 'de', 'de', 'de'],
                            2  => ['ar', 'ar', 'ar', 'dr', 'dr', 'dr', 'dr', 'dr', 'de', 'de'],
                            3  => ['ar', 'ar', 'ar', 'ar', 'dr', 'dr', 'dr', 'dr', 'dr', 'de'],
                            4  => ['ae', 'ar', 'ar', 'ar', 'ar', 'dr', 'dr', 'dr', 'dr', 'dr'],
                            5  => ['ae', 'ae', 'ar', 'ar', 'ar', 'ar', 'dr', 'ex', 'ex', 'dr'],
                            6  => ['ae', 'ae', 'ae', 'ae', 'ar', 'ar', 'ex', 'ex', 'ex', 'ex']
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
