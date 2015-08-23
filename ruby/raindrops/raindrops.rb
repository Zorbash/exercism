require 'prime'

module Raindrops
  extend self

  def convert(num)
    num.prime_division.flatten.uniq.sort.tap do |factors|
      str = ''
      str += 'Pling' if factors.include? 3
      str += 'Plang' if factors.include? 5
      str += 'Plong' if factors.include? 7

      if !factors.include?(3) && !factors.include?(5) && !factors.include?(7)
        str = num.to_s
      end

      return str
    end
  end
end
