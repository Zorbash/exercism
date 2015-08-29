class Integer
  ROMANS = {
    1 => 'I',
    5 => 'V',
    10 => 'X',
    50 => 'L',
    100 => 'C',
    500 => 'D',
    1000 => 'M'
  }

  def to_roman(number = self)
    return ROMANS[number] if ROMANS.key? number

    multitude, remainder = _divide(number)

    _compose(multitude) + (remainder.zero? ? '' : to_roman(remainder))
  end

  def _divide(number)
    pow = number.abs.to_s.size - 1
    multitude = (number / 10 ** pow) * (10 ** pow)

    [multitude, number - multitude]
  end

  def _compose(number)
    return ROMANS[number] if ROMANS.key? number

    min, max = _range(number)

    # Is there a number which can be subtracted from the max to make the number?
    max_diffs = ROMANS.keys.select { |k| k < max }.map! { |k| [k, max - k] }
    min_subtraction, _ = max_diffs.find { |_, diff| diff == number }

    return ROMANS[min_subtraction] + ROMANS[max] if min_subtraction

    divisor = ROMANS.keys.select { |k| k < number }.reverse!.find { |k| number % k == 0 }

    ROMANS[min] + (ROMANS[divisor] * ((number - min) / divisor))
  end

  def _range(number)
    less, more = ROMANS.keys.partition { |k| number > k }

    [less.last, more.first || Float::INFINITY]
  end
end
