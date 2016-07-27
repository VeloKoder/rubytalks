require 'open-uri'

class Anagram  
  def initialize
    @file_content  = open('http://fs61.www.ex.ua/get/954287360089/daddd8c731e42a7a8731e4f8680c211e/261048605/wl.txt').read
    if @file_content.length
      self.words = @file_content.split(/\n/)
    end
  end

  def words()
    @words
  end
  
  def words=(words)
    @words = words
  end 

  def anagrams?(word_a, word_b)
    return false if word_a.length != word_b.length
    word_a_arr = word_a.scan /\w/
    word_b_arr = word_b.scan /\w/
    xor_arr = word_a_arr + word_b_arr - (word_a_arr & word_b_arr)
    !(xor_arr.length > 0)
  end

  def find_anagrams_for(input_word)
    self.words.inject([]) do |result, file_word| 
      result << file_word if self.anagrams?(file_word, input_word) and !file_word.eql?(input_word)
      result
    end
  end

  private

  @file_content = nil
  @words = nil
	
end


a = Anagram.new

ARGV.each do |word|
  puts "Anagram for \"#{word}\": #{a.find_anagrams_for(word).join(', ')}"
end
