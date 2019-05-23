class TestClass
  attr_accessor :name

  def initialize(name='test')
    @name = name
  end

  def call(puts_text)
    puts puts_text
  end
end
