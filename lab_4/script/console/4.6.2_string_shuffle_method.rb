class String
  def shuffle
    self.split("").shuffle.join
  end
end

original = "foobar"
shuffled = original.shuffle
p original
p shuffled
p shuffled.chars.sort == original.chars.sort
p original == "foobar"
p "".shuffle == ""
p "a".shuffle == "a"
p "aabb".shuffle.chars.sort == "aabb".chars.sort
