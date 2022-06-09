class DNA
  attr_reader :strand

  def initialize(strand)
    @strand = strand
  end

  def hamming_distance(other_strand)
    hamming_distance = 0
    measurable = [other_strand.size, strand.size].min

    measurable.times do |index|
      hamming_distance += 1 if strand[index] != other_strand[index]
    end

    hamming_distance
  end
end

    dna = DNA.new('AGACAACAGCCAGCCGCCGGATT')
    p dna.hamming_distance('AGGCAA')
    p dna.hamming_distance('AGACATCTTTCAGCCGCCGGATTAGGCAA')
    p dna.hamming_distance('AGG')