def string_shuffle(s)
  s.split("").shuffle.join
end

original = "foobar"
shuffled = string_shuffle(original)
p original
p shuffled
p shuffled.chars.sort == original.chars.sort
p original == "foobar"
p string_shuffle("") == ""
p string_shuffle("a") == "a"
p string_shuffle("aabb").chars.sort == "aabb".chars.sort
