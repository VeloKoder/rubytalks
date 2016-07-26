class Anagram
  def initialize
    @h = {};
    @f = File.open('/home/vadym/Downloads/wl.txt').read.split("\n")
    @f.each do |a| 
      k = a_to_k(a)
      @h[k].nil? ? @h[k] = [a] : @h[k] << a
    end
  end

  def find(a)
    @h[a_to_k(a)] - [a]
  end

  private 
  def a_to_k(a)
    a.split('').sort.join
  end
end

ag = Anagram.new

puts ag.find('horse')
puts ag.find('carthorse')
