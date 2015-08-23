module Hamming
  extend self

  VERSION = 1

  def compute(stra, strb)
    raise ArgumentError unless stra.size == strb.size

    strb.chars.tap do |strb_chars|
      return stra.chars.each.with_index.reduce(0) do |dist, (char, idx)|
        dist += 1 if char != strb_chars[idx]
        dist
      end
    end
  end
end
