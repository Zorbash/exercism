class Prime
  class << self
    def prime?(number)
      return false if number < 2

      (2..Math.sqrt(number).floor).none? { |n| (number % n).zero? }
    end

    def generator
      Enumerator.new { |y| (1..Float::INFINITY).each { |n| y << n if prime? n } }
    end

    def nth(number)
      raise ArgumentError if number <= 0

      generator.each_with_index { |n, i| return n if i == number - 1 }
    end
  end
end
