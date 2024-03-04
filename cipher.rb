def cipher(string, shift)
    shift %= 26 if shift.to_i > 26
    string.chars.map do |char|
      if char.match(/[A-Za-z]/)
        if char.match(/[A-Z]/)
          ((char.ord - 'A'.ord + shift) % 26 + 'A'.ord).chr
        else
          ((char.ord - 'a'.ord + shift) % 26 + 'a'.ord).chr
        end
      else
        char
      end
    end.join
  end
  
  puts cipher('What a string!', 5)