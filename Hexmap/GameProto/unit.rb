class Unit
  attr_reader :unit_type, :strength

  def initialize(unit_type, strength)
    @unit_type = unit_type
    @strength = strength
  end

  def representation
    case @unit_type
    when 'artillery'
      '[O]'
    when 'cavalry'
      '[/]'
    when 'infantry'
      '[X]'
    else
      raise 'unrecognized unit type'
    end
  end
end
