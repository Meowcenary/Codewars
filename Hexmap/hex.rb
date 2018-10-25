class Hex
  attr_accessor :unit
  attr_reader :column, :row, :terrain

  def initialize(column, row, terrain='clear', unit=nil)
    @column = column
    @row = row
    @terrain = terrain
    @unit = unit
  end

  def coordindate
    "|#{@column}, #{@row}|"
  end
end

