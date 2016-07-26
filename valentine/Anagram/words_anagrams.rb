def anagrams key_word
  @key_word = key_word
  @letters = key_word.scan(/\w/)
    .each_with_object(Hash.new(0)){ |letter, hash| hash[letter] += 1 }
  File.open('wl.txt').map {|word| word.chomp!; word if anagram?(word)}.compact
end

def anagram? word
  return if word.length != @key_word.length
  @letters.each do |letter, quantity|
    return if word.scan(/#{letter}/).count != quantity
  end
end

p anagrams('horse')
p anagrams('carthorse')
