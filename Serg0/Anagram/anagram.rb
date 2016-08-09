def get_letters_hash(word)
  letters_arr = {}
  word.chars.to_a.each { |l| letters_arr.has_key?(l) ? letters_arr[l] += 1 : letters_arr[l] = 1 } unless word.nil?
  letters_arr
end

def hashes_equal(h1, h2)
  return false if h1.keys.count != h2.keys.count
  h1.each { |k1, v1| return false if h2[k1] != v1 }
  return true
end

def get_anagrams(word)
  anagrams = []
  word_letters_hash = get_letters_hash(word)
  IO.readlines("wl.txt").each do |line|
    anagrams << line.chomp if hashes_equal(word_letters_hash, get_letters_hash(line.chomp))
  end
  anagrams
end

get_anagrams(ARGV[0])
