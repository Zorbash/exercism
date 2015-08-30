class Robot
  attr_reader :name

  def initialize
    @name = self.class._generate_name.next
  end

  def reset
    @name = self.class._generate_name.next
  end

  class << self
    def _generate_name
      @enumerator ||= Enumerator.new do |y|
        strings = ('A'..'Z').to_a.repeated_permutation(2).lazy
        string = strings.next.join
        number = 0

        loop do
          y << "#{string}#{number.to_s.rjust(3, '0')}"

          if number == 999
            number = 0
            string = strings.next.join
          else
            number += 1
          end
        end
      end
    end
  end
end
