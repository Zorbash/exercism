class Squares
  attr_reader :n

  def initialize(n)
    @n = n
  end

  def square_of_sums
    1.upto(n).reduce(:+) ** 2
  end

  def sum_of_squares
    1.upto(n).map { |num| num ** 2 }.reduce(:+)
  end

  def difference
     square_of_sums - sum_of_squares
  end
end
