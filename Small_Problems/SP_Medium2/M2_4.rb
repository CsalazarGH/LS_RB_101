# Balanced Paranthesis
def balanced?(string)
  parans = string.split('').keep_if {|char| '()'.include?(char)}.join
  
  loop do
    parans.gsub!('()', ' ')
    parans = parans.split(' ').join
    break if (parans == '') || (parans.gsub('()', ' ') == parans)
  end

 parans == '' ? true : false
end


p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false