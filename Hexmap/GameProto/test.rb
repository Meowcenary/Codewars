Dir["./*.rb"].each {|file| require file }

def create_units(units)
  units.map do |unit_type|
    Unit.new(unit_type.first, unit_type.last)
  end
end

units = [['artillery', 2], ['cavalry', 1], ['infantry', 3]]

@red_units = create_units(units)
@blue_units = create_units(units)
@game = Game.new
