class Diamond
  def self.make_diamond(last_letter)
    diamond_lines = []
    letter_num = last_letter.ord - 64
    margin = 0
    gap = (((letter_num)*2) - 3).abs

    letter_num.downto(1) do |num|
      letter = (num + 64).chr

      line = build_line(margin, gap, letter)
      diamond_lines.push(line) unless diamond_lines.empty?
      diamond_lines.unshift(line)

      gap = gap.negative? ? 0 : gap - 2
      margin += 1
    end

    diamond_lines.join
  end

  private

  class << self
    def build_line(margin, gap, letter)
      if letter == "A"
        " " * margin + letter + " " * margin + "\n"
      else
        " " * margin + letter + " " * gap + letter + " " * margin + "\n"
      end
    end
  end
end

puts Diamond.make_diamond('L')
