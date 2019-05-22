# when you have some time play with this a bit and see if you can figure out
# more about it, trick challenge
class Operation
  # each operation is a distinct object (or at least I think that's the case) it
  # seems to me that @num will be assigned a fixnum from the NUMBER_WORDS loop
  def initialize(num, op)
    @num = num
    @op = op
  end

  # here num is the function defined by a number word e.g 'one' it's a little
  # convoluted, but in that function operation is an optional argument which is
  # then called using send: https://apidock.com/ruby/Object/send according to
  # the documentation anything following the symbol specifying the function is
  # an argument to the function being called with send
  def perform(num)
    num.send(@op, @num.to_f)
  end
end

NUMBER_WORDS = %w(zero one two three four five six seven eight nine)
OPERATION_WORDS = {
  :"+" => "plus",
  :"-" => "minus",
  :"*" => "times",
  :"/" => "divided_by"
}

NUMBER_WORDS.each_with_index do |word, num|
  # this is interesting: https://apidock.com/ruby/Module/instance_method; this
  # creates methods using the non-arabic character/
  define_method word.to_sym do |operation = nil|
    operation ? operation.perform(num) : num
  end
end

OPERATION_WORDS.each do |method, word|
  # this defines a method e.g 'plus' that takes an argument 'num' and then
  # passes the symbol for the operation so that it can be used with #send on the
  # Operation class
  define_method word.to_sym do |num|
    Operation.new(num, method)
  end
end
