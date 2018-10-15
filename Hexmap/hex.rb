class Hex
  attr_accessor :content
  attr_reader :column, :row

  def initialize(column, row)
    @column = column
    @row = row
    @content = nil
  end

  def coordindate
    "|#{@column}, #{@row}|"
  end
end

