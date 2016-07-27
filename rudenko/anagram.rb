def anagrams(w, file)
  letters = w.split('').group_by { |l| l }
  IO.foreach(file).map do |line|
    line = line.strip
    next if line.empty? || w.size != line.size || !letters.all? { |k, v| line.count(k) == v.size }
    line
  end.compact
end

puts anagrams(ARGV[0], ARGV[1])
