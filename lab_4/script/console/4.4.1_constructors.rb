s = "foobar"
p s
p s.class

s = String.new("foobar")
p s
p s.class
p s == "foobar"

a = Array.new([1, 3, 2])
p a
p a.class

h = Hash.new
p h
p h[:foo]

h = Hash.new(0)
p h[:foo]
