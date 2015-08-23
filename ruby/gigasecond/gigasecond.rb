module Gigasecond
  extend self

  VERSION = 1

  def from(time)
    time + 10 ** 9
  end
end
