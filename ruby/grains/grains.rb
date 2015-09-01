module Grains
  extend self

  def square(num)
    _sequence.each_with_index { |pow, i| return pow if i == num - 1 }
  end

  def total
    _sequence.take(64).reduce(:+)
  end

  def _sequence
    @_sequence ||= Enumerator.new do |y|
      y << index = 1
      loop { y << index *= 2 }
    end
  end
end
