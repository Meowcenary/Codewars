Dir["./*.rb"].each {|file| require file }

units = [['artillery', 2], ['cavalry', 1], ['infantry', 3]]

@red_units = units.map do |unit_type|
  Unit.new(unit_type.first, unit_type.last)
end

@blue_units = units.map do |unit_type|
  Unit.new(unit_type.first, unit_type.last)
end

