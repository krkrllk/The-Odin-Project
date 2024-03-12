dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

def substrings(string, dictionary)
  word = string.downcase
  dictionary.reduce(Hash.new(0)) do |result, substring|
    count = word.scan(substring).length
    result[substring] += count if count > 0
    result
  end
end

p substrings("below", dictionary)
p substrings("Howdy partner, sit down! How's it going?", dictionary)