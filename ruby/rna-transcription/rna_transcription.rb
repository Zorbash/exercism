require 'set'

module Complement
  extend self

  VERSION = 2

  REPLACEMENTS = {
    'G' => 'C',
    'C' => 'G',
    'T' => 'A',
    'A' => 'U'
  }

  def of_dna(sequence)
    raise ArgumentError unless sequence.chars.to_set <= REPLACEMENTS.keys.to_set

    sequence.gsub(/./, REPLACEMENTS)
  end

  def of_rna(sequence)
    raise ArgumentError unless sequence.chars.to_set <= REPLACEMENTS.values.to_set

    sequence.gsub(/./, REPLACEMENTS.invert)
  end
end
