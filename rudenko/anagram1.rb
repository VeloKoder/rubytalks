class Anagram
  attr_accessor :input, :file, :result

  def initialize(args = {})
    args.each { |k, v| send("#{k}=", v) }
    self.input = group(input)
  end

  def run
    self.result = File.read(file).split("\n").select { |l| input == group(l) }
  end

  protected

  def group(word)
    word.each_byte.group_by { |i| i }
  end
end

a = Anagram.new(input: ARGV[0], file: ARGV[1])
a.run
puts a.result