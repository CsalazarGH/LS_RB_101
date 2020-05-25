def block_word?(string)
  blocks = {'B' => 'O',
             'X' => 'K',
             'D' => 'Q',
             'C' => 'P',
             'N' => 'A',
             'G' => 'T',
             'R' => 'E',
             'F' => 'S',
             'J' => 'W',
             'H' => 'U',
             'V' => 'I',
             'L' => 'Y',
             'Z' => 'M' }.to_a

  letters = string.chars
  
  array = []

  letters.each do |char| # 'B'
    blocks.each do |block| # ['B', 'O']
      if block.include?(char.upcase)
        array << char
        blocks.delete(block)
      end
    end
  end

  array.join == string
end

p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true